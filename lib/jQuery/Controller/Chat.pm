package jQuery::Controller::Chat;

use strict;
use warnings;
use base 'Catalyst::Controller';

=head1 NAME

jQuery::Controller::Chat - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index 

=cut

sub bar : Local
{
   my ( $self, $c ) = @_;
   
   $c->stash->{response} = {
      status  => 1,
      time => time(),
      message => "Hello World!", 
   };
}

sub form : Local
{
   my ( $self, $c ) = @_;

   $c->stash( css => 'chat.css',
              javascript => 'chat.js',
              template => 'chat.tt' ); 
}

sub postmsg : Local
{
   my ( $self, $c ) = @_;

   my $name = $c->req->params->{name};
   my $msg = $c->req->params->{message};
   my $time = time(); 
   my $message = $c->model('DB::Messages')->create({
         user => $name,
         msg => $msg,
         time => $time,
      });
   $c->stash( response => {
      alert => "Message posted",
      time => $time
   });
   $c->stash( current_view => 'XML' );
}

sub getmsgs : Local
{
   my ( $self, $c ) = @_;

   my $last = $c->req->params->{time} || 0;
   my $messages = $c->model('DB::Messages')->search(
       { time => {'>', $last} },
       {order_by => 'id DESC',
        rows => 10 });
   my $count = $messages->count;
   my $status = ($count == 0) ? 2 : 1;
   my $response = { status => $status,
                    time => $last,
                  };

   if ($count > 0 )
   {
      foreach my $message ( reverse($messages->all) )
      {
         push @{$response->{message}},
             { author => $message->user,
               text => $message->msg, };
         $response->{time} = $message->time;
      }   
   }
   $c->stash( response => $response );
   $c->stash( current_view => 'XML' );
}

=head1 AUTHOR

Gerda Shank

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
