require 5.004;  # It'll work if they have a new Test::Harness.
use ExtUtils::MakeMaker;

WriteMakefile
    (
     NAME		=> 'Test',
     VERSION_FROM	=> './lib/Test.pm',
     PREREQ_PM	  	=> { 'Test::Harness' => 1.1601 },
     INSTALLDIRS        => 'perl',
    );
