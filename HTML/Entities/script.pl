#!/usr/bin/perl
use warnings;
use strict;
use feature 'say';

use utf8;

use HTML::Entities;

say encode_entities ('> René');   # prints «&gt; Ren&eacute;»
