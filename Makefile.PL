use ExtUtils::MakeMaker;

WriteMakefile
    (
     NAME		=> 'Test',
     VERSION_FROM	=> 'lib/Test.pm',
     dist		=> {COMPRESS=>'gzip -9f', SUFFIX => 'gz'},
    );

print "
After you install this extension, you must manually delete the old
Test::Harness so perl will find the new one in site_perl.  (You will not
have to do this once the changes have been rolled back into the main
distribution.)

";
