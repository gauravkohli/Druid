package Perl::Druid::PostAggregator::FieldAccess;
use Moo;

extends 'Perl::Druid::PostAggregator';

has fieldName	=> (is  => 'ro');

sub type 	{ 'fieldAccess' }

sub build {
	my $self = shift;
	
	my $filter = {
		'type' 		=> $self->type,
		'name' 		=> $self->name,
		'fieldName' => $self->fieldName,
	};

	return $filter;
}

1;

