package jQuery::Schema::DB::Books;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("books");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "title",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "rating",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04999_01 @ 2008-09-22 17:14:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AE+lFjhPQjUdr3HVPenFgg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
