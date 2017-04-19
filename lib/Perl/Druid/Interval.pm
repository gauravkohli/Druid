package Perl::Druid::Interval;

use Moo;

has start	=> (is => 'ro');
has end		=> (is => 'ro');

sub build {
	my $self = shift;
	
	return sprintf("%s/%s", $self->start, $self->end);
}

1;