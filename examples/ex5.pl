#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use Error::Pure::JSON::Advance qw(err);

# Additional parameters.
%Error::Pure::JSON::Advance::ERR_PARAMETERS = (
        'status' => 1,
        'message' => 'Foo bar',
);

# Error.
err '1', '2', '3';

# Output like:
# TODO