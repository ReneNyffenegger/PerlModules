#!/usr/bin/perl
use warnings;
use strict;

use Git::Repository;
use File::Path;
use File::Slurp;

my $repo_dir = '/tmp/a-git-repository';

my $git_repo = create_a_repository();

write_file("$repo_dir/aFile.txt", <<"FILE");
first line
second line
third line
FILE

$git_repo->run(add=>'aFile.txt');
print $git_repo->run('ls-files'), "\n";
$git_repo->run('commit', '-m', 'added aFile.txt');
print $git_repo->run('ls-files'), "\n";

for my $obj (map { s/.*(..)\/(......................................)/$1$2/; $_ } glob("$repo_dir/.git/objects/**/*")) {
 
  my $type    = $git_repo->run('cat-file' => $obj, '-t');
  my $content = $git_repo->run('cat-file' => $obj, '-p');

  print "$obj [$type]\n";
  print $content;

  print "\n\n";
 
}

sub create_a_repository { #_{

  rmtree $repo_dir if -d $repo_dir;

  Git::Repository->run(init=>$repo_dir);

  my $git_repo = Git::Repository->new(work_tree=>$repo_dir);

  return $git_repo;

} #_}
