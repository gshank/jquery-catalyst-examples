package jQuery::Controller::AJIA;

use strict;
use warnings;
use base 'Catalyst::Controller';

=head1 NAME

jQuery::Controller::Boots - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index 

=cut

sub index : Path 
{
    my ( $self, $c ) = @_;

    my @boots = $c->model('DB::Boots')->all; 
    $c->stash( boots => \@boots,
               javascript => 'boots.js',
               template => 'boots.tt' ); 
}

sub get_details : Local
{
   my ( $self, $c ) = @_;

   my $id = $c->req->params->{style};
   my $boot = $c->model('DB::Boots')->find($id) if $id;
   $boot = { name => "---", sku => "---", height => "---",
             colors => "---", lining => "---", price => "---", features => "---" }
             unless $id;
   $c->stash( boot => $boot, nowrapper => 1, template => 'boot_details.tt' );
}

sub console : Local
{
   my ( $self, $c ) = @_;

   $c->stash( template => 'console.tt', css => 'jqia_common.js',
              javascript => 'console.js' );
}

sub reflect_data : Local
{
   my ( $self, $c ) = @_;

   $c->stash( javascript => 'reflect_data.js', template => 'reflect_data.tt',
              css => 'jqia_common.js' );
}

sub get_data : Local
{
   my ( $self, $c ) = @_;

   $c->response->body("a = " . $c->req->params->{a} . 
                      "\nb = " . $c->req->params->{b} .
                      "\nc = " . $c->req->params->{c});
}

sub return_error : Local
{
   my ( $self, $c ) = @_;
   $c->response->status(555);
   $c->response->body("This is an error message");
}

sub get_colors : Local
{
   my ( $self, $c ) = @_;

   my $boot_id = $c->req->params->{style};
   my $colors = $c->model('DB::BootColors')->search({boot_id => $boot_id}) 
      if $boot_id;
   my $json_data = [{value => "", caption => "choose color"}];
   while (my $color = $colors->next)
   {
      push @{$json_data}, {value => $color->code, caption => $color->caption};
   }
   $c->stash( json_data => $json_data );
   $c->detach( $c->view('JSON') );
}

sub get_sizes : Local
{
   my ( $self, $c ) = @_;

   # Following params aren't actually used, but in a fully featured
   # app, they ought to be
   my $boot_id = $c->req->params->{style};
   my $color_code = $c->req->params->{color};
   my $sizes = $c->model('DB::BootSizes');
   my $json_data = [{value => "", caption => "choose size"}];
   while (my $size = $sizes->next)
   {
      push @{$json_data}, {value => $size->code, caption => $size->caption};
   }
   $c->stash( json_data => $json_data );
   $c->detach( $c->view('JSON') );
}

sub get_term : Local
{
   my ( $self, $c ) = @_;
   my $term = $c->req->params->{term};
   my $row = $c->model('DB::Term')->find(lc($term));
   my $definition = $row ? $row->definition : "Unknown Term";
   $c->response->body($definition);
}

sub flyout : Local
{
   my ( $self, $c ) = @_;

}

=head1 AUTHOR

Gerda Shank

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
