use ExtUtils::MakeMaker;

WriteMakefile
    (
     NAME		=> 'Test',
     VERSION_FROM	=> 'lib/Test.pm',
     dist		=> {COMPRESS=>'gzip -9f', SUFFIX => 'gz'},
     'macro'		=> { INSTALLDIRS => 'perl' },
    );

warn "\nAll tests should succeed...
  except for one test in t/onfail.t
             and all tests in t/fail.t

";

