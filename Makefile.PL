# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Perl module for JSON output for structured errors.';
author 'Michal Špaček <skim@cpan.org>';
license 'bsd';
name 'Error-Pure-JSON';
requires 'Error::Pure::Utils' => 0.11;
requires 'Error::Pure::Output::JSON' => 0.01;
requires 'List::MoreUtils' => 0;
requires 'Readonly' => 0;
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=Error-Pure-JSON';
resources 'homepage' => 'https://github.com/tupinek/Error-Pure-JSON';
resources 'repository' => 'git://github.com/tupinek/Error-Pure-JSON';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.05;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
