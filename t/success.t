# -*-perl-*-
use strict;
use Test;
BEGIN { plan tests => 6 }

ok(ok(1));
ok(ok('fixed', 'fixed'));
ok(skip(1));
