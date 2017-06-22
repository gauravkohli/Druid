package Druid::Filter::Logical;
use Moo;

extends 'Druid::Filter';

has fields	=> (is  => 'ro', default => sub { [] });

sub build {
    my $self = shift;

    my $filter = {
        'type'      => $self->type,
        'fields'    => []
    };

    map { 
        push @{$filter->{'fields'}}, $_->build;
    }  @{$self->fields};

return $filter;
}

1;

