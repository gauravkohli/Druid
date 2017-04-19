package Perl::Druid::Query;

use Moo;

sub query_type {
    my $self = shift;
    $self->{_query_type} = shift;

    return $self;
}

sub data_source {
    my $self = shift;
    $self->{_data_source} = shift;

    return $self;
}

sub granularity {
    my $self = shift;
    $self->{_granularity} = shift;

    return $self;
}

sub descending {
    my $self = shift;
    $self->{_descending} = shift;

    return $self;
}

sub aggregations {
    my $self = shift;
    my $aggregation = shift;

	$self->{_aggregations} //= [];
	push(@{ $self->{_aggregations} }, $aggregation->build);

    return $self;
}

sub filter {
    my $self = shift;
    my $filter = shift;

	$self->{_filters} = $filter->build;

    return $self;
}


sub intervals {
	my $self = shift;
    my $interval = shift;
    
    $self->{_intervals} //= [];
    push(@{ $self->{_intervals} }, $interval->build);

	return $self;
}

sub gen_query {
	my $self = shift;
	
	my %request_hash = (
		'queryType' 	=> $self->{_query_type},
		'dataSource' 	=> $self->{_data_source},
		'granularity' 	=> $self->{_granularity},
		'descending' 	=> $self->{_descending},
		'aggregations' 	=> $self->{_aggregations},
		'intervals' 	=> $self->{_intervals},
		'filter' 		=> $self->{_filters}
	);
	
	return \%request_hash;

}

1;