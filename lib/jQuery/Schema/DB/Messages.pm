package jQuery::Schema::DB::Messages;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("messages");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "INTEGER",
    is_auto_increment => 1,
    is_nullable => 0,
    size => undef,
  },
  "user",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "msg",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "time",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04999_01 @ 2008-09-22 17:14:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YVZ7kL8aHZyjr2mHTFL1Dg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
