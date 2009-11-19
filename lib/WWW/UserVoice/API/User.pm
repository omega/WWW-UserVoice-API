package WWW::UserVoice::API::User;
# ABSTRACT: A UserVouce User

use Moose;
with 'WWW::UserVoice::API::Role::Public'; # We are not auth_required

has 'id' => (
    is => 'ro',
    isa => 'Int',
    required => 1,
);

1;