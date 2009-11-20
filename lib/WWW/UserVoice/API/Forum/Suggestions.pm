package WWW::UserVoice::API::Forum::Suggestions;

use Moose;

with 'WWW::UserVoice::API::Role::Public';

has 'forum' => (is => 'ro', isa => 'WWW::UserVoice::API::Forum', required => 1);

sub list {
    my ($self) = @_;
    # We need to fetch this JSON biatch
    my $json = $self->get($self->url);
}

sub search {
    my ($self) = @_;
    $self->throw('NotImplemented');
}

sub show {
    my ($self) = @_;
    $self->throw('NotImplemented');
}


sub url {
    my $self = shift;
    my $method = shift || '';
    return $self->forum->url . "suggestions" . ( $method ? "/$method" : '');
};
1;