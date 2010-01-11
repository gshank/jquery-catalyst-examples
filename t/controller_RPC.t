use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'jQuery' }
BEGIN { use_ok 'jQuery::Controller::RPC' }

ok( request('/rpc')->is_success, 'Request should succeed' );


