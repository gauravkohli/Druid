package Perl::Druid::Query;

use Moo;

use Perl::Druid::Interval;
use Perl::Druid::Aggregation;

has query_type 	=> (is => 'ro');
has data_source => (is => 'ro');

sub granularity {
    my $self = shift;
    $self->{_granularity} = shift;

    return $self;
}

sub descending {
    my $self = shift;
    $self->{_descending} = 'true';
    return $self;
}

sub ascending {
    my $self = shift;
    $self->{_descending} = 'false';
    return $self;
}

sub aggregation {
    my $self = shift;
    my ($type, $name, $fieldName) = @_;

	my $aggregation = Perl::Druid::Aggregation->new(
			type		=>	$type,
			name		=>	$name,
			fieldName	=>	$fieldName
	);

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


sub interval {
	my $self = shift;
    my ($start, $end) = @_;

	my $interval = Perl::Druid::Interval->new(start	=>	$start, end	=>	$end);
   
    $self->{_intervals} //= [];
    push(@{ $self->{_intervals} }, $interval->build);

	return $self;
}

sub gen_query { }

1;