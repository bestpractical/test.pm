# -*-perl-*-

use strict;
use Test;
use vars qw($mycnt);

BEGIN { plan test => 5, iffail => sub { ++$mycnt; } }

$mycnt = 0;

ok($mycnt, 0);
ok(0);
ok($mycnt, 1);
ok(0);
ok($mycnt, 1);
