package jQuery::View::TT;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config(TEMPLATE_EXTENSION => '.tt',
                    INCLUDE_PATH => [
                      jQuery->path_to('root', 'templates')
                    ],
                    WRAPPER => "layouts/wrapper.tt",
                   );


=head1 NAME

jQuery::View::TT - TT View for jQuery

=head1 DESCRIPTION

TT View for jQuery. 

=head1 AUTHOR

=head1 SEE ALSO

L<jQuery>

Gerda Shank

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
