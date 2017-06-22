package Druid::Query::GroupBy;
use Moo;

extends 'Druid::Query';
use Hash::Merge qw( merge );

sub query_type 	{ 'groupBy' }

sub gen_query {
    my $self = shift;
    my $request_hash =  $self->SUPER::gen_query();

    my %groupby_request_hash = (
        'dimensions'    => $self->{_group_by_dimensions},
        'limitSpec'     => $self->{_limit_spec},
    );

    return merge($request_hash, \%groupby_request_hash);

}

1;