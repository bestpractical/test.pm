# -*-perl-*-
use strict;
use Test;
BEGIN { todo tests => 3, failok => [3]; }

ok(1);

ok(sub { 
       my $r = 0;
       for (my $x=0; $x < 10; $x++) {
	   $r += $x*($r+1);
       }
       $r == 3628799
   });

ok(0);
