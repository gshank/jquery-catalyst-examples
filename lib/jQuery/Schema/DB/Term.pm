package jQuery::Schema::DB::Term;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("term");
__PACKAGE__->add_columns(
  "name",
  { data_type => "text", is_nullable => 0, size => undef },
  "definition",
  { data_type => "text", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("name");


1;
