package WWW::UserVoice::API::Exception::NotImplemented;

use Moose;
extends 'WWW::UserVoice::API::Exception';

has '+title' => (default => 'Feature not implemented');

1;