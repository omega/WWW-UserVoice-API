package WWW::UserVoice::API;
# ABSTRACT: A perl-interface to the UserVoice API

use Moose;
with 'WWW::UserVoice::API::Role::Throw';

use WWW::UserVoice::API::Traits;

use WWW::UserVoice::API::Forum;

has 'account_key' => (is => 'ro', isa => 'Str', required => 1, predicate => 'has_account_key');
has 'api_key' => (is => 'ro', isa => 'Str', required => 0, predicate => 'has_api_key');

sub can_do_secure {
    return !!$_[0]->has_api_key;
}

sub forum {
    my ($self, %args) = @_;
    
    return WWW::UserVoice::API::Forum->new(api => $self, id => $args{id});
}

sub base_url {
    my $self = shift;
    return ($self->can_do_secure ? 'https://api.uservoice.com/' : 'http://' . $self->account_key . ".uservoice.com/");
}

1;