package WWW::UserVoice::API::Feedback;
# ABSTRACT: A class for handeling the feedback part of uservoice
use Moose;

with 'WWW::UserVoice::API::Role::Secure'; # We are auth_required


sub create {
    my ($self) = @_;
    $self->throw('NotImplemented');
}

sub list {
    my ($self) = @_;
    $self->throw('NotImplemented');
}

1;