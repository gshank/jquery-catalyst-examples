#!/usr/bin/perl 

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";

=head1 NAME

    jquery_schema_dump.pl

=head1 DESCRIPTION

    Dumps the schema in the database to lib/jQuery/Schema/SchemaDump

=head1 SYNOPSIS

   script/jquery_schema_dump.pl

=cut

use DBIx::Class::Schema::Loader ('make_schema_at');

make_schema_at(
   'jQuery::Schema::SchemaDump',
   { debug => 1, 
	 dump_directory => "$FindBin::Bin/../lib" },
   [ 'dbi:SQLite:db/jquery.db' ],
  ); 

 # should remove SchemaDump.pm file
