# -*-perl-*-
use strict;
use Test;
BEGIN { plan tests => 4 }

skip(1, 0);  #should skip

my $skipped=1;
skip(1, sub { $skipped = 0 });
skip(sub {1}, sub { $skipped = 0 });
ok($skipped, 1, "skip situation");
