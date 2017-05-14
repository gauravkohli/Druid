package Perl::Druid::Query::Timeseries;
use Moo;

extends 'Perl::Druid::Query';

sub query_type 	{ 'timeseries' }

sub gen_query {
	my $self = shift;
	
	my %request_hash = (
		'queryType' 	    => $self->query_type,
		'dataSource' 	    => $self->data_source,
		'granularity' 	    => $self->{_granularity},
		'descending' 	    => $self->{_descending},
		'aggregations' 	    => $self->{_aggregations},
		'postAggregations' 	=> $self->{_post_aggregations},
		'intervals' 	    => $self->{_intervals},
		'filter' 		    => $self->{_filters}
	);
	
	return \%request_hash;

}

1;