use strict;
package Test;
use Test::Harness 1.16 ();
use Carp;
use vars qw($VERSION @ISA @EXPORT $ntest %failok);
$VERSION = "0.03";
require Exporter;
@ISA=('Exporter');
@EXPORT= qw(&todo &ok &skip $ntest);

$|=1;
#$^W=1;  ?
$ntest=1;

# Use of this variable is strongly discouraged.  It is set
# exclusively for test coverage analyzers.
$ENV{REGRESSION_TEST} = $0;

sub todo {
    croak "todo(%args): odd number of arguments" if @_ & 1;
    my $max=0;
    for (my $x=0; $x < @_; $x+=2) {
	my ($k,$v) = @_[$x,$x+1];
	if ($k =~ /^test(s)?$/) { $max = $v; }
	elsif ($k eq 'failok') { for (@$v) { $failok{$_}=1; }; }
	else { carp "Test::todo(): skipping unrecognized directive '$k'" }
    }
    my @failok = sort { $a <=> $b } keys %failok;
    if (@failok) {
	print "1..$max fails ".join(' ', @failok).";\n";
    } else {
	print "1..$max\n";
    }
}

sub ok {
    my ($ok, $guess) = @_;
    carp "(this is ok $ntest)" if defined $guess && $guess != $ntest;
    $ok = $ok->() if (ref $ok or '') eq 'CODE';
    if ($ok) {
	if ($failok{$ntest}) {
	    print("ok $ntest # Wow!\n");
	} else {
	    print("ok $ntest\n");
	}
    } else {
	print("not ok $ntest\n");
    }
    ++ $ntest;
    $ok;
}

sub skip {
    my ($toskip, $ok, $guess) = @_;
    carp "(this is skip $ntest)" if defined $guess && $guess != $ntest;
    $toskip = $toskip->() if (ref $toskip or '') eq 'CODE';
    if ($toskip) {
	print "ok $ntest # skip\n";
	++ $ntest;
	1;
    } else {
	ok($ok);
    }
}

1;
__END__

=head1 NAME

  Test - provides a simple framework for writing test scripts

=head1 SYNOPSIS

  use strict;
  use Test;
  BEGIN { todo tests => 5, failok => [3,4] }

  ok(0); #failure
  ok(1); #success

  ok(0); #ok, expected failure (see failok above)
  ok(1); #surprise success!

  skip($feature_is_missing, sub {...});    #do platform specific test

=head1 DESCRIPTION

Test::Harness expects to see particular output when it executes test
scripts.  This module tries to make conforming just a little bit
easier (and less error prone).

=head1 TEST CATEGORIES

=over 4

=item * NORMAL TESTS

These tests are expected to succeed.  If they don't, something is
wrong.

=item * SKIPPED TESTS

Skipped tests should be used to skip platform specific tests when a
required feature isn't available.

=item * FAILOK TESTS

Tests listed in failok will never be reported as failures, regardless
of their success.  In fact, they are expected NOT to succeed.  As soon
as a failok test starts working, it should be promoted to a normal
test (remove from the failok list).

Packages should NOT be released with successful failok tests.  Failok
tests are only made available in the interest of maintaining an
executable TODO list.

=back

=head1 SEE ALSO

L<Test::Harness> and various test coverage analysis tools.

=head1 AUTHOR

Copyright © 1998 Joshua Nathaniel Pritikin.  All rights reserved.

This package is free software and is provided "as is" without express
or implied warranty.  It may be used, redistributed and/or modified
under the terms of the Perl Artistic License (see
http://www.perl.com/perl/misc/Artistic.html)

=cut
