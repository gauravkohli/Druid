package Perl::Druid::Filter::Logical::NotFilter;
use Moo;

extends 'Perl::Druid::Filter::LogicalFilter';

sub type 	{ 'not' }

sub build {
	my $self = shift;

    if( scalar @{$self->fields} != 1 ){
    	die $self. " can only have one fields attribute"
    }
	
	my $filter = {
		'type' 		=> $self->type,
		'field'		=> @{$self->fields}[0]->build
	};

	return $filter;
}

1;