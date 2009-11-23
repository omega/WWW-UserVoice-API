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


use LWP::UserAgent;
use URI::QueryParam;
use JSON::XS;

has 'ua' => (is => 'ro', isa => 'LWP::UserAgent', lazy => 1, builder => '_lazy_ua');
sub _lazy_ua {
    my $ua = LWP::UserAgent->new();
    my $v = eval "\$WWW::UserVoice::API::VERSION" || '0.00-devel';
    $ua->agent('WWW-UserVoice-API/' . $v . $ua->_agent);
    
    $ua;
}
has 'json' => (is => 'ro', isa => 'JSON::XS', lazy => 1, builder => '_lazy_json');
sub _lazy_json {
    JSON::XS->new()->utf8();
}

sub get {
    
    my ($self, $uri, $params) = @_;
    $uri = URI->new($uri . ".json");
    
    my $res = $self->ua->request($self->make_request($uri));
    if ($res->is_success) {
        return $self->parse_content($res->decoded_content);
    } else {
        $self->throw('HTTPError' => { res => $res });
    }
}

sub make_request {
    my ($self, $uri) = @_;
    my $req = HTTP::Request->new('GET', $uri);
    if ($self->can_do_secure) {
        $req->authorization_basic($self->account_key, $self->api_key);
    }
    return $req;
}

sub parse_content {
    my ($self, $content) = @_;
    return $self->json->decode($content);
}

1;