#!/usr/bin/perl -w

use strict;
use Test::More;
END { done_testing(); };
use WWW::UserVoice::API;
use Data::Dump qw/dump/;

my $f = WWW::UserVoice::API->new(account_key => 'tvguide')->forum(id => 31003);

{
    my $suggestions = $f->list_suggestions;
    diag(dump($suggestions));
}



