use ExtUtils::MakeMaker;

WriteMakefile
    (
     NAME		=> 'Test',
     VERSION_FROM	=> 'Test.pm',
     dist		=> {COMPRESS=>'gzip -9f', SUFFIX => 'gz'},
    );
