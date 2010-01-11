package jQuery::Schema::DB::BootColors;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("boot_colors");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "INTEGER",
    is_auto_increment => 1,
    is_nullable => 0,
    size => undef,
  },
  "boot_id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "code",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "caption",
  { data_type => "TEXT", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("id");


1;
