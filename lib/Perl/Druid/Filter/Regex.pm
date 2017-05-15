package Perl::Druid::Filter::Regex;
use Moo;

extends 'Perl::Druid::Filter';

sub type 	{ 'regex' }
has pattern	=> (is => 'ro');

sub build {
    my $self = shift;

    my $filter = {
        'type' 		=> $self->type,
        'dimension' => $self->dimension,
        'pattern' 	=> $self->pattern,
    };

    return $filter;
}

1;

