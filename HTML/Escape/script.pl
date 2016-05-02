#!/usr/bin/perl
use warnings;
use strict;
use feature 'say';

use utf8;

use HTML::Escape;

say escape_html ('> René');   # prints «&gt; René»
