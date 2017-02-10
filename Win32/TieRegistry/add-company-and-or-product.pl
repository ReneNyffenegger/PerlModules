use warnings;
use strict;

use Win32::TieRegistry (Delimiter=>'/');

my $companyName ="TQ84";
my $productName ="perlTest";
my $softwareKey ="HKEY_CURRENT_USER/Software";


my $companyKey;
my $productKey;


# does company exist in registry?
$companyKey = $Registry->{"$softwareKey/$companyName"};
if (defined $companyKey) {

  print "I found Company $companyName in registry\n";

  $productKey=$Registry->{"$softwareKey/$companyName/$productName"};

  if (defined $productKey) {
    print "Found product $productName, too\n";
  }
  else {
    print "But, I did not find $productName\n";
    $productKey = $Registry->{"$softwareKey/$companyName/$productName"}={};
  }
}
else {
  
  print "I did not find $companyName in registry\n";
  $Registry->{"$softwareKey/$companyName"}={};

  # also, create product:
  $productKey = $Registry->{"$softwareKey/$companyName/$productName"}={};
}


# printing existing values
foreach my $k (keys %$productKey) {
  print "$k = $productKey->{$k}\n";
}

# setting the default value:
$productKey->{'/'} = "new default value";

# setting some other values:
$productKey->{'test_val_1'} = "7";
$productKey->{'test_val_2'} = 42;
$productKey->{'test_val_3'} = "0x470";
