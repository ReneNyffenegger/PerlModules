use warnings;
use strict;
use feature 'say';

use File::HomeDir;

say "Home:      " . File::HomeDir->my_home;
say "Desktop:   " . File::HomeDir->my_desktop;
say "Documents: " . File::HomeDir->my_documents;
say "Music:     " . File::HomeDir->my_music;
say "Pictures:  " . File::HomeDir->my_pictures;
say "Videos:    " . File::HomeDir->my_videos;
say "Data:      " . File::HomeDir->my_data;

#  Use «users_home($username)» instead my_home etc to
#  get another user's home, desctop documents etc
#
#  TODO File::HomeDir->my_dist_data and
#       File::HomeDir->my_dist_config

