require 5.004_05; #probably
use ExtUtils::MakeMaker;

WriteMakefile
    (
     NAME		=> 'Test',
     VERSION_FROM	=> './Test.pm',
     PREREQ_PM	  	=> { 'Test::Harness' => 1.1601 },
     'macro'		=> { INSTALLDIRS => 'perl' }, #??
    );
