# -*-perl-*-
use strict;
use Test;
BEGIN { todo tests => 3 }

skip(0, 1);
skip(sub { 1 }, sub { 0 });
skip(1);
