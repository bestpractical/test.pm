use 5.005; # for qr//
use ExtUtils::MakeMaker;

WriteMakefile
    (
     NAME		=> 'Test',
     VERSION_FROM	=> './Test.pm',
     PREREQ_PM	  	=> { 'Test::Harness' => 1.1601 },
     'macro'		=> { INSTALLDIRS => 'perl' }, #??
    );
