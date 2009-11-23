#!/usr/bin/perl -w

use strict;
use Test::More;
END { done_testing(); };
use WWW::UserVoice::API;
use Data::Dump qw/dump/;

{
    my $f = WWW::UserVoice::API->new(account_key => 'tvguide')->forum(id => 31003);

    {
        my $suggestions = $f->list_suggestions;
        ok(scalar(@{ $suggestions }));
    }
    
}

if ($ENV{UV_API_KEY}) {
    my $f = WWW::UserVoice::API->new(account_key => 'tvguide', api_key => $ENV{UV_API_KEY})->forum(id => 31003);

    {
        my $suggestions = $f->list_suggestions;
        ok(scalar(@{ $suggestions }));
    }
    
}



