# -*-perl-*-
use strict;
use Test;
BEGIN { plan tests => 11 }

my $r=0;
$r |= ok();
$r |= skip(0);
$r |= ok(0);
$r |= ok(0,1);
$r |= ok(sub { 1+1 }, 3);
$r |= ok(sub { 1+1 }, sub { 2 * 0});

my @list = (0,0);
$r |= ok(scalar(@list), 1, "\@list=".join(',',@list));
$r |= ok(scalar(@list), 1, sub { "\@list=".join(',',@list) });

for (1..2) {
    $r |= ok(0);
}

ok($r); # failure==success
