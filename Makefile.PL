require 5.004;  # It'll work if they have a new Test::Harness.
use ExtUtils::MakeMaker;
# Time-stamp: "2002-08-27 20:20:27 MDT"

WriteMakefile
    (
     NAME		=> 'Test',
     VERSION_FROM	=> './lib/Test.pm',
     ABSTRACT_FROM	=> './lib/Test.pm',
     PREREQ_PM	  	=> { 'Test::Harness' => 1.1601 },
     INSTALLDIRS        => 'perl',
    );

{
    package MY;

    sub test_via_harness {
        my($self, $orig_perl, $tests) = @_;

        my @perls = ($orig_perl);
        push @perls, qw(bleadperl 
                        perl5.6.1
                        perl5.6.0
                        perl5.005_03 
                        perl5.004_05 
                        perl5.004_04
                        perl5.004)
          if $ENV{PERL_TEST_ALL};

        my $out;
        foreach my $perl (@perls) {
            $out .= $self->SUPER::test_via_harness($perl, $tests);
        }

        return $out;
    }
}
