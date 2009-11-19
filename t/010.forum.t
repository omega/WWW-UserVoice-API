#!/usr/bin/perl -w

use strict;
use Test::More;
END { done_testing(); };

use WWW::UserVoice::API;

my $f = WWW::UserVoice::API->new()->forum(id => 31003);

{
    my $suggestions = $f->list_suggestions;
}



