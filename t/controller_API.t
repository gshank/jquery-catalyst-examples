use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'jQuery' }
BEGIN { use_ok 'jQuery::Controller::API' }

ok( request('/api')->is_success, 'Request should succeed' );


