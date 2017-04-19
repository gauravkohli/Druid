package Perl::Druid::Filter::SelectorFilter;
use Moo;

extends 'Perl::Druid::Filter';

sub type 	{ 'selector' }
has value	=> (is => 'ro');

sub build {
	my $self = shift;
	
	my $filter = {
		'type' 		=> $self->type,
		'dimension' => $self->dimension,
		'value' 	=> $self->value,
	};

	return $filter;
}

1;

