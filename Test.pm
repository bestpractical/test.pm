use strict;
package Test;
use Carp;
use vars qw($VERSION @ISA @EXPORT $ntest %failok);
$VERSION = "0.02";
require Exporter;
@ISA=('Exporter');
@EXPORT= qw(&todo &ok $ntest);

$|=1;
$^W=1;
$ntest=1;

$ENV{REGRESSION_TEST} = $0; #use of this variable is strongly discouraged

sub todo {
    croak "todo(%args): odd number of arguments" if @_ & 1;
    my $max=0;
    for (my $x=0; $x < @_; $x+=2) {
	my ($k,$v) = @_[$x,$x+1];
	if ($k =~ /^test(s)?$/) { $max = $v; }
	elsif ($k eq 'failok') { for (@$v) { $failok{$_}=1; }; }
	else { carp "Test::todo(): skipping unrecognized directive '$k'" }
    }
    print "1..$max\n";
}

sub ok {
    my ($ok, $guess) = @_;
    carp "(this is ok $ntest)" if defined $guess && $guess != $ntest;
    if ((ref $ok or '') eq 'CODE') {
	$ok = $ok->();
    }
    if ($ok) {
	print("ok $ntest\n");
    } else {
	if ($failok{$ntest}) {
	    print("ok $ntest # skip\n");
	} else {
	    print("not ok $ntest\n");
	}
    }
    ++ $ntest;
    $ok;
}

1;
__END__

=head1 NAME

  Test - provides a simple framework for writing test scripts

=head1 SYNOPSIS

  use strict;
  use Test;
  BEGIN { todo tests => 15, failok => [3,7] }

  my $result = "looks good";
  ok($result =~ m/good/) or warn $result;

=head1 DESCRIPTION

Test::Harness expects to see particular output when it executes test
scripts.  This module tries to make conforming just a little bit
easier (and less error prone).

Tests listed in failok will never fail.  They will either succeed or
be skipped.

=head1 AUTHOR

Copyright © 1998 Joshua Nathaniel Pritikin.  All rights reserved.

This package is free software and is provided "as is" without express
or implied warranty.  It may be used, redistributed and/or modified
under the terms of the Perl Artistic License (see
http://www.perl.com/perl/misc/Artistic.html)

=cut
