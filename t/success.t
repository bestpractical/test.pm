# -*-perl-*-
use strict;
use Test;
BEGIN { plan tests => 10 }

ok(ok(1));
ok(ok('fixed', 'fixed'));
ok(skip(1,0));
ok(ok 'the brown fox jumped over the lazy dog', '/lazy/');
ok(ok 'the brown fox jumped over the lazy dog', 'm,fox,');
