#!/usr/bin/perl -w

use strict;
use Test::More 0.88;
END { done_testing(); };

use Test::Exception;

use WWW::UserVoice::API;

{
    my $a = WWW::UserVoice::API->new();
}
