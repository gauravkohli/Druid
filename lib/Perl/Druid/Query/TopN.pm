package Perl::Druid::Query::TopN;
use Moo;

extends 'Perl::Druid::Query';
use Hash::Merge qw( merge );

sub query_type 	{ 'topN' }

sub gen_query {
    my $self = shift;
    my $request_hash =  $self->SUPER::gen_query();

    my %topn_request_hash = (
        'dimension' => $self->{_dimension},
        'threshold' => $self->{_threshold},
        'metric'    => $self->{_metric},
    );

    return merge($request_hash, \%topn_request_hash);

}

1;