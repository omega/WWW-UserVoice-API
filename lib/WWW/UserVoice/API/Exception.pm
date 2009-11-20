package WWW::UserVoice::API::Exception;

use Moose;
use overload '""' => sub { $_[0]->title . "\n" . $_[0]->description }, fallback => 1;
has 'title' => (is => 'ro', isa => 'Str', required => 1);

has 'description' => (is => 'ro', isa => 'Str', required => 0, default => '');

1;