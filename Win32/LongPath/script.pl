    use warnings;
    use strict;
    
    use Win32::LongPath;
    
    print system ('rmdir /s /q test');
    mkdirL('test');
    
    for my $i (200 .. 255) {
    
      my $dir_name = 'test/' . sprintf("%04d", $i) . ('a' x ($i-4));
      mkdirL($dir_name);
    
      openL(\my $fh, '>', "$dir_name/" . ('_' x 200) . '.txt') or die "$^E";
      print $fh 'Hello!';
    # closeL $fh;
    }
