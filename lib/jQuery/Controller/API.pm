package jQuery::Controller::API;

use strict;
use warnings;
use base 'Catalyst::Controller';

=head1 NAME

jQuery::Controller::API - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index 

=cut


sub default : Path
{
   my ( $self, $c ) = @_;

   $c->xmlrpc;
}

sub add : Remote
{
   my ( $self, $c, $a, $b ) = @_;

#   return $a + $b;
   return RPC::XML::int->new( $a + $b );
}

=head1 AUTHOR

Gerda Shank

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
