#!/usr/bin/env perl

use strict;
use warnings;
use lib qw(lib ../lib);

use POE qw/Component::CSS::Minifier/;

my $poco = POE::Component::CSS::Minifier->spawn;

POE::Session->create( package_states => [ main => [qw(_start results)] ], );

$poe_kernel->run;

sub _start {
    $poco->minify(
        { event => 'results', infile => 'div:hover { border: 1px solid #000; }' }
    );
}

sub results {
    print "Minified CSS:\n$_[ARG0]->{out}\n";
    $poco->shutdown;
}