package WWW::UserVoice::API::Trait::RequireForum;
# ABSTRACT: A trait we can put on our top-level API attributes that require forum_id
use Moose::Role;


package Moose::Meta::Attribute::Custom::Trait::RequireForum;
sub register_implementation {'WWW::UserVoice::API::Trait::RequireForum'}


1;
