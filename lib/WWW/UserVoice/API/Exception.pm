package WWW::UserVoice::API::Exception;

use Moose;

has 'title' => (is => 'ro', isa => 'Str', required => 1);


1;