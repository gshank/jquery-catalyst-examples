package jQuery;

use strict;
use warnings;

use Catalyst::Runtime;

# Set flags and add plugins for the application
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a YAML file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root 
#                 directory

use Catalyst ('-Debug',
              'ConfigLoader',
              'Static::Simple',
);

our $VERSION = '0.01';

# Configure the application. 
#
# Note that settings in jquery.yml (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with a external configuration file acting as an override for
# local deployment.

jQuery->config( name => 'jQuery' );
jQuery->config({
    'View::JSON' => {
       allow_callback => 1,
       callback_param => 'cb',
       expose_stash => 'json_data'
    }
});
jQuery->config->{default_view} = 'TT';
jQuery->config->{static} = {
   include_path => [ jQuery->config->{root} ],
#   dirs => [ 'static', 'css', 'js', 'json', 'html', 'xml' ],
   ignore_extensions => ['tt', 'php'],
};
       

# Start the application
__PACKAGE__->setup;


=head1 NAME

jQuery - Catalyst based application

=head1 SYNOPSIS

    script/jquery_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<jQuery::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Gerda Shank

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
