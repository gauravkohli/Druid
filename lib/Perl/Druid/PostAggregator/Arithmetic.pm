package Perl::Druid::PostAggregator::Arithmetic;
use Moo;

extends 'Perl::Druid::PostAggregator';

has fn	        => (is	=> 'ro');
has fields	    => (is  => 'ro', default => sub { [] });
has ordering	=> (is  => 'ro', default => 'null');

sub type 	{ 'arithmetic' }

sub build {
	my $self = shift;
	
	my $aggregation = {
		'type' 		=> $self->type,
		'name' 		=> $self->name,
		'fn'        => $self->fn,
		'fields'    => [],
		'ordering'  => $self->ordering,
	};

	map { 
		push @{$aggregation->{'fields'}}, $_->build;
	}  @{$self->fields};
	
	return $aggregation;
}

1;

