use warnings;
use strict;

use File::Find::Rule;

use File::Spec;
use Cwd 'abs_path';

my $github_perl_modules_root_dir = abs_path(File::Spec -> catfile(__FILE__, '../../../..'));

print "Root: $github_perl_modules_root_dir\n\n";

print join "\n", File::Find::Rule -> name('*.pl') -> in ($github_perl_modules_root_dir);

