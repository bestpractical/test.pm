use ExtUtils::MakeMaker;

WriteMakefile
    (
     NAME		=> 'Test',
     VERSION_FROM	=> 'lib/Test.pm',
     dist		=> {COMPRESS=>'gzip -9f', SUFFIX => 'gz'},
     'macro'		=> { INSTALLDIRS => 'perl' },
    );

warn "\nAll tests should succeed...\n  except for all of the tests in t/fail.t.\n";
