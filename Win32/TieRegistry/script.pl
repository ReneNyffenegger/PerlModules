use warnings;
use strict;

use Win32::TieRegistry (Delimiter => '/');

my $reg_vars = $Registry->{'HKEY_CURRENT_USER/Environment'};

print "\nShowing variables\n";
for my $var_with_slash (keys %{ $reg_vars } ) {
  my $var = substr($var_with_slash, 1);
  print "$var = " . $reg_vars->{$var_with_slash} . "\n";
}


print "\n\nCreating a few values in the registry (probably needs admin rights under LMachine)\n";
$Registry -> {"LMachine/Software/TQ84/"} = { #"foo" or die $!;
    "foo/" => {
          "x" => "42.42",
          "y/" => {
              "some-text"   => 'Some Text',
              "some-binary" => [ pack("ccc", 16, 32, 48), "REG_BINARY" ],
              "some-dword"  => [ "0x0005", "REG_DWORD" ],
          },
          "z/" => {
              "more-text"       => "abc",
              "even-more-text"  => "def",
          },
     },
     "bar/" => {
          "a" => "aaa aaa",
     },
     "baz" => 'baaaz'
   } or die $!;


print "\nStarting regedit to see the changes\n";
# http://stackoverflow.com/a/12516008/180275
$Registry -> {'HKEY_CURRENT_USER/Software/Microsoft/Windows/CurrentVersion/Applets/Regedit/LastKey'} = 'Computer\HKEY_LOCAL_MACHINE\SOFTWARE\TQ84';

system ('regedit');

print "\nDeleting the TQ84 key\n";
delKey("LMachine/Software/TQ84/");
system ('regedit');

sub delKey {

  my $regKey = shift;

  for my $k (keys %{$Registry -> {$regKey}}) {
    if (substr($k, -1) eq '/') {
       delKey ("$regKey$k");
       delete $Registry -> {"$regKey$k"}; 
    }
    else {
      delete $Registry -> {"$regKey$k"};
    }
  }

  delete $Registry -> {$regKey};

}
