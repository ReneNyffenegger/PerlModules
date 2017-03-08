#!/usr/bin/perl
use warnings;
use strict;
use 5.10.0;

use DBI;
my $db = 'sqlite_last_insert_id.db';

unlink $db if -f $db;

my $dbh = DBI->connect("dbi:SQLite:dbname=$db") or die "Could not create $db";
$dbh -> {AutoCommit} = 0;

$dbh -> do ('

  create table tq84_words (
     id    integer primary key autoincrement,
     word  text not null
  )
') or die;

$dbh -> do ('create index tq84_words_ix on tq84_words(word)');

insert_word('foo');
insert_word('bar');
insert_word('foo');
insert_word('baz');
insert_word('bar');

$dbh -> commit;

sub insert_word {

  my $word = shift;

  state $sth_sel = $dbh -> prepare('select id from tq84_words where word = ?');
  state $sth_ins = $dbh -> prepare('insert into tq84_words (word) values (?)');

  my $id;
  $id = $dbh->selectrow_array($sth_sel, {}, $word);

  if ($id) {
    print "$word already inserted with id $id\n";
    return;
  }

  $sth_ins->execute($word);
  $id = $dbh->sqlite_last_insert_rowid;

  print "Inserted $word, id = $id\n";

}
