# -*-perl-*-
use strict;
use Test qw($TESTOUT $ntest ok skip plan); plan tests => 14;

open F, ">fails";
$TESTOUT = *F{IO};

my $r=0;
$r |= skip(0,0);
$r |= ok(0);
$r |= ok(0,1);
$r |= ok(sub { 1+1 }, 3);
$r |= ok(sub { 1+1 }, sub { 2 * 0});

my @list = (0,0);
$r |= ok @list, 1, "\@list=".join(',',@list);
$r |= ok @list, 1, sub { "\@list=".join ',',@list };
$r |= ok 'segmentation fault', '/bongo/';

for (1..2) { $r |= ok(0); }

$r |= ok(1, undef);
$r |= ok(undef, 1);

ok($r); # (failure==success :-)

close F;
$TESTOUT = *STDOUT{IO};
$ntest = 1;

open F, "fails";
my $O;
while (<F>) { $O .= $_; }
close F;
unlink "fails";

ok join(' ', map { m/(\d+)/; $1 } grep /^not ok/, split /\n+/, $O),
    join(' ', 1..13);

my @got = split /not ok \d+\n/, $O;
shift @got;

my $expect = join('',<DATA>);
$expect =~ s/\n+$//;
my @expect = split /\n\n/, $expect;

for (my $x=0; $x < @got; $x++) {
    ok $got[$x], $expect[$x]."\n";
}

__DATA__
# Failed test 1 in t/fail.t at line 9

# Failed test 2 in t/fail.t at line 10

# Test 3 got: '0' (t/fail.t at line 11)
#   Expected: '1'

# Test 4 got: '2' (t/fail.t at line 12)
#   Expected: '3'

# Test 5 got: '2' (t/fail.t at line 13)
#   Expected: '0'

# Test 6 got: '2' (t/fail.t at line 16)
#   Expected: '1' (@list=0,0)

# Test 7 got: '2' (t/fail.t at line 17)
#   Expected: '1' (@list=0,0)

# Test 8 got: 'segmentation fault' (t/fail.t at line 18)
#   Expected: '/bongo/'

# Failed test 9 in t/fail.t at line 20

# Failed test 10 in t/fail.t at line 20 fail #2

# Failed test 11 in t/fail.t at line 22

# Test 12 got: <UNDEF> (t/fail.t at line 23)
#    Expected: '1'

# Failed test 13 in t/fail.t at line 25
