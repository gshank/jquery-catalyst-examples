package jQuery::Controller::LJQ;

use strict;
use warnings;
use base 'Catalyst::Controller';

=head1 NAME

jQuery::Controller::LJQ - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index 

=cut

sub index : Path {
    my ( $self, $c ) = @_;

}

sub dict1 : Local
{
   my ( $self, $c ) = @_;

   $c->stash( template => 'ljq/dict1.tt', javascript => 'dict1.js',
              css => 'dictionary.css' );
}

=cut

sub json_b : Local
{
   my ( $self, $c ) = @_;
   $c->res->content_type("application/json; charset=UTF-8");
   $c->stash( template => 'ljq/b.tt', nowrapper => 1 );
}

=head1 AUTHOR

Gerda Shank

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
