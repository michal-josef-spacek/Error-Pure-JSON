#!/usr/bin/env perl

use strict;
use warnings;

use Error::Pure::JSON qw(err);

# Error.
err '1';

# Output like:
# [{"msg":["1"],"stack":[{"sub":"err","prog":"example1.pl","args":"(1)","class":"main","line":11}]}]