#!/usr/bin/perl
use warnings;
use strict;

use DBI;

my     $db = 'func.db';
unlink $db if -f $db;

my $dbh = DBI->connect("dbi:SQLite:dbname=$db") or die "Could not create $db";

$dbh->do('
 create table tab (
   operand_1 number,
   operator  text,
   operand_2 number
 )
') or die;

my $sth_ins = $dbh->prepare('insert into tab values (?, ?, ?)') or die;
$sth_ins -> execute(5, '+', 12);
$sth_ins -> execute(3, '*',  9);
$sth_ins -> execute(8, '/',  4);
$sth_ins -> execute(9, '-',  2);

$dbh -> sqlite_create_function ('some_math', 3, sub {
  my $op1 = shift;
  my $op  = shift;
  my $op2 = shift;

  my $ret = "$op1 $op $op2 = ";

     if ($op eq '+') { $ret .= $op1 + $op2; }
  elsif ($op eq '-') { $ret .= $op1 - $op2; }
  elsif ($op eq '*') { $ret .= $op1 * $op2; }
  elsif ($op eq '/') { $ret .= $op1 / $op2; }

  return $ret;

}) or die;

  my $sth_sel = $dbh->prepare('select some_math(operand_1, operator, operand_2) as res from tab') or die;
  $sth_sel -> execute;

while (my $rec = $sth_sel->fetchrow_hashref) {
  print $rec->{res}, "\n";
}
# 5 + 12 = 17
# 3 * 9 = 27
# 8 / 4 = 2
# 9 - 2 = 7
