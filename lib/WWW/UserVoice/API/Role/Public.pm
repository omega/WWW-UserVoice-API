package WWW::UserVoice::API::Role::Public;
# ABSTRACT: A role for API-classes that can work with the public uservoice api

use Moose::Role;
use LWP::UserAgent;

with 'WWW::UserVoice::API::Role::Throw';

has 'api' => (is => 'ro', required => 1, isa => 'WWW::UserVoice::API', 
    handles => [qw/can_do_secure api_key account_key base_url get/]
);

1;