package WWW::UserVoice::API::Role::Throw;
# ABSTRACT: A simple throw method

use Moose::Role;

sub throw {
    my ($self, $class, $args) = @_;
    $args ||= {};
    $class = $class =~ m/^\+/ ? $class : 'WWW::UserVoice::API::Exception::' . $class;
    Class::MOP::load_class($class) or die "could not load $class";
    my $e = $class->new($args);
    die $e;
}
1;