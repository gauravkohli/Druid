package Druid::Query::Timeseries;
use Moo;

extends 'Druid::Query';
use Hash::Merge qw( merge );

sub query_type { 'timeseries' }

sub gen_query {
    my $self = shift;
    my $request_hash =  $self->SUPER::gen_query();

    my %timeseries_request_hash = (
        'descending' => $self->{_descending},
    );

    return merge($request_hash, \%timeseries_request_hash);
}

1;
