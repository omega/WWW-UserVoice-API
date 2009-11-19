package WWW::UserVoice::API::Role::Secure;
# ABSTRACT: A role for API-classes that need auth
use Moose::Role;
with 'WWW::UserVoice::API::Role::Public'; # We might as well piggyback what we can

1;