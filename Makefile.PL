use ExtUtils::MakeMaker;

WriteMakefile
    (
     NAME		=> 'Test',
     VERSION_FROM	=> 'lib/Test.pm',
     dist		=> {COMPRESS=>'gzip -9f', SUFFIX => 'gz'},
     'macro'		=> { INSTALLDIRS => 'perl' },
    );

warn "\nAll tests should succeed...
  except for two tests in t/iffail.t
             and all tests in t/fail.t

";

