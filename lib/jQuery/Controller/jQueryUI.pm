package jQuery::Controller::jQueryUI;

use strict;
use warnings;
use base 'Catalyst::Controller';

=head1 NAME

jQuery::Controller::jQueryUI - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index 

=cut

sub index : Path
{
   my ( $self, $c ) = @_;

}

sub dialog : Local
{
   my ( $self, $c ) = @_;

   $c->stash( css => 'jquery-ui.css',
              javascript => 'jquery-ui.js',
              template => 'jqueryui/dialog.tt' ); 
}

sub do_delete : Local {
    my ( $self, $c ) = @_;

    $c->res->body('<h1>Something should be deleted...</h1>');
}

=head1 AUTHOR

Gerda Shank

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
