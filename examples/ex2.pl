#!/usr/bin/env perl

use strict;
use warnings;

use Error::Pure::JSON qw(err);

# Error.
err '1', '2', '3';

# Output like:
# [{"msg":["1","2","3"],"stack":[{"sub":"err","prog":"example2.pl","args":"(1, 2, 3)","class":"main","line":11}]}]