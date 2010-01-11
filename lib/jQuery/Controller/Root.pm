package jQuery::Controller::Root;

use strict;
use warnings;
use base 'Catalyst::Controller';

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

=head1 NAME

jQuery::Controller::Root - Root Controller for jQuery

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 default

=cut

sub index : Path  
{
    my ( $self, $c ) = @_;

    $c->stash( template => 'index.tt' );
}

sub quotes : Local
{
   my ( $self, $c ) = @_;

   $c->stash(javascript => 'quotes.js');
   $c->stash(template => 'quotes.tt');
}

sub get_quote : Local
{
   my ( $self, $c ) = @_;

   my @prefixes = ('Mashup', '2.0', 'Tagging', 'Folksonomy');
   my @suffixes = ('Web', 'Push', 'Media', 'GUI [18]');

   my $rand_pref = $prefixes[int(rand(4))];
   my $rand_suf = $suffixes[int(rand(4))];
   my $quote = "$rand_pref is the new $rand_suf"; 
   $c->response->body($quote);
}

sub hello : Local
{
   my ( $self, $c ) = @_;
   $c->stash( json_data => 'Hello World!' );
   $c->forward('View::JSON');
}

=head2 end

Attempt to render a view, if needed.

=cut 

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Gerda Shank

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
