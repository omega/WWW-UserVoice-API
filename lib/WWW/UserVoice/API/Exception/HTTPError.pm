package WWW::UserVoice::API::Exception::HTTPError;

use Moose;
extends 'WWW::UserVoice::API::Exception';

has '+title' => (default => 'Error during HTTP transaction');

has 'res' => (is => 'ro', isa => 'HTTP::Response', required => 1);

around 'description' => sub {
    my $orig = shift;
    
    return shift->res->status_line;
};
1;