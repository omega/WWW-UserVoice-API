package WWW::UserVoice::API::Forum;
# ABSTRACT: A UserVoice Forum
use Moose;
use WWW::UserVoice::API::Forum::Suggestions;

with 'WWW::UserVoice::API::Role::Public'; # We are not auth_required
has 'id' => (
    is => 'ro',
    isa => 'Int',
    required => 1,
);

has 'suggestions' => (
    is => 'ro',
    isa => 'WWW::UserVoice::API::Forum::Suggestions',
    handles => {
        'list_suggestions' => 'list',
        'search_suggestions' => 'search',
        'get_suggestion' => 'show',
    },
    lazy => 1,
    builder => '_lazy_suggestions',
);

sub _lazy_suggestions {
    my $self = shift;
    WWW::UserVoice::API::Forum::Suggestions->new( api => $self->api, forum => $self )
}
sub url {
    my $self = shift;
    
    my $url = $self->base_url(@_);
    
    return $url . "forums/" . $self->id . "/";
}
1;