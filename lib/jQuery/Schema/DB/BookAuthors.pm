package jQuery::Schema::DB::BookAuthors;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("book_authors");
__PACKAGE__->add_columns(
  "book_id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "author_id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("book_id", "author_id");


# Created by DBIx::Class::Schema::Loader v0.04999_01 @ 2008-09-22 17:14:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yYMrIUqM787DhmZNSHv3lA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
