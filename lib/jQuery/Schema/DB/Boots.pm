package jQuery::Schema::DB::Boots;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("boots");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "INTEGER",
    is_auto_increment => 1,
    is_nullable => 0,
    size => undef,
  },
  "name",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "sku",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "height",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "lining",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "colors",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "price",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "features",
  { data_type => "TEXT", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("id");


1;
