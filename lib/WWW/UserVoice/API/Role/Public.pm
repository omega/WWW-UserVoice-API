package WWW::UserVoice::API::Role::Public;
# ABSTRACT: A role for API-classes that can work with the public uservoice api

use Moose::Role;
use LWP::UserAgent;

with 'WWW::UserVoice::API::Role::Throw';

use LWP::UserAgent;
use URI::QueryParam;
use JSON;

has 'ua' => (is => 'ro', isa => 'LWP::UserAgent', lazy => 1, builder => '_lazy_ua');
sub _lazy_ua {
    my $ua = LWP::UserAgent->new();
    my $v = eval "\$WWW::UserVoice::API::VERSION" || '0.00-devel';
    $ua->agent('WWW-UserVoice-API/' . $v . $ua->_agent);
    
    $ua;
}
has 'json' => (is => 'ro', isa => 'JSON', lazy => 1, builder => '_lazy_json');
sub _lazy_json {
    JSON->new()->utf8(1);
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

has 'api' => (is => 'ro', required => 1, isa => 'WWW::UserVoice::API', 
    handles => [qw/can_do_secure api_key account_key base_url/]
);

sub make_request {
    my ($self, $uri) = @_;
    HTTP::Request->new('GET', $uri);
}

sub parse_content {
    my ($self, $content) = @_;
    
    return $self->json->decode($content);
}
1;