# Pragmas.
use strict;
use warnings;

# Modules.
use Cwd qw(realpath);
use English qw(-no_match_vars);
use Error::Pure::JSON qw(err);
use File::Spec::Functions qw(catfile);
use FindBin qw($Bin);
use IO::CaptureOutput qw(capture);
use Test::More 'tests' => 9;
use Test::NoWarnings;

# Test.
eval {
	err 'Error.';
};
is($EVAL_ERROR, "Error.\n", 'Simple message in eval.');

# Test.
eval {
	err 'Error.';
};
my $tmp = $EVAL_ERROR;
eval {
	err $tmp;
};
is($EVAL_ERROR, "Error.\n", 'More evals.');

# Test.
eval {
	err undef;
};
is($EVAL_ERROR, "undef\n", 'Error undefined value.');

# Test.
eval {
	err ();
};
is($EVAL_ERROR, "undef\n", 'Error blank array.');

# Test.
my ($stdout, $stderr);
capture sub {
	system $EXECUTABLE_NAME, realpath(catfile($Bin, '..', 'data', 'ex1.pl'));
} => \$stdout, \$stderr;
is($stdout, '', 'Error in standalone script - stdout.');
my $right_stderr = qr{\[{"msg":\["Error."\],"stack":\[{"sub":"err","prog":".*?t/data/ex1.pl","args":"\('Error.'\)","class":"main","line":11}\]}\]};
like($stderr, $right_stderr, 'Error in standalone script - stderr.');

# Test.
($stdout, $stderr) = ('', '');
capture sub {
	system $EXECUTABLE_NAME, realpath(catfile($Bin, '..', 'data', 'ex2.pl'));
} => \$stdout, \$stderr;
is($stdout, '', 'Error with parameter and value in standalone script - stdout.');
$right_stderr = qr{\[{"msg":\["Error.","Parameter","Value"\],"stack":\[{"sub":"err","prog":".*?t/data/ex2.pl","args":"\('Error.', 'Parameter', 'Value'\)","class":"main","line":11}\]}\]};
like($stderr, $right_stderr, 'Error with parameter and value in standalone '.
	'script - stderr.');
