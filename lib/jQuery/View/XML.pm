package jQuery::View::XML;

use strict;
use warnings;
use base 'Catalyst::View';
use Encode ();
use XML::Simple ();

our $VERSION = '0.01';

__PACKAGE__->config( expose_stash => 'response' );

sub process {
    my ($self, $c, $root) = @_;

    my $cond = sub { 1 };

    my $single;
    if (my $expose = $self->{expose_stash}) {
        if (ref $expose eq 'Regexp') {
            $cond = sub { $_[0] =~ $expose };
        }
        elsif (ref $expose eq 'ARRAY') {
            my %match = map { $_ => 1 } @$expose;
            $cond = sub { $match{$_[0]} };
        }
        elsif (not ref $expose) {
            $single = $expose;
        }
        else {
            $c->log->warn('expose_stash should be an array referernce or Regexp object.');
        }
    }

    my $encoding = $self->{encoding} || 'UTF-8';

    $c->res->content_type("application/xml; charset=$encoding");

    my $data = $single
        ? $c->stash->{$single}
        : { map { $cond->($_) ? ($_ => $c->stash->{$_}) : () } keys %{ $c->stash } };
    my $body = $self->render($c, $data, $single ? $single : $root);
    $body = Encode::encode($encoding, $body) if Encode::is_utf8($body);
    $c->res->body($body);
}

sub render {
    my ($self, $c, $data, $root) = @_;

    my $args = {
        NoAttr   => 1,
        RootName => $root || $self->{root_name} || 'response',
    };

    local $XML::Simple::PREFERRED_PARSER = 'XML::LibXML::SAX'
        if eval { require XML::LibXML::SAX };

    return eval { XML::Simple->new(%$args)->xml_out($data) };
}

1;

=head1 NAME

jQuery::View::XML

=head1 SYNOPSIS

in your controller:

  package MyApp::Controller::Foo;

  sub bar : Local {
      my ($self, $c) = @_;

      $c->stash->{response} = {
          code    => 0,
          message => 'blah blah blah',
      };
  }

  sub end : Private {
      my ($self, $c) = @_;

      $c->forward( $c->view('XML') );

      # <response>
      #   <code>0</code>
      #   <message>blah blah blah</message>
      # </response>
  }

=head1 METHODS

=head2 process

=head2 render

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<XML::Simple>, L<Catalyst::View::JSON>, L<Catalyst::View>

=cut
