# -*-perl-*-

use strict;
use Test;
use vars qw($mycnt);

BEGIN { plan test => 7, onfail => \&myfail }

$mycnt = 0;

my $why = "zero != one";
ok(0, 1, $why);

sub myfail {
    my ($f) = @_;
    ok(@$f, 1);

    my $t = $$f[0];
    ok($$t{diagnostic}, $why);
    ok($$t{'package'}, 'main');
    ok($$t{repetition}, 1);
    ok($$t{result}, 0);
    ok($$t{expected}, 1);
}
