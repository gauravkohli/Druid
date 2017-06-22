package Druid::Constants;

use strict;
use warnings;

use Exporter;
our @ISA = qw( Exporter );

my %constants;
BEGIN {
    %constants = (
        Granularity => {
            ALL             => 'all',
            NONE            => 'none',
            SECOND          => 'second',
            MINUTE          => 'minute',
            FIFTEEN_MINUTE  => 'fifteen_minute',
            THIRTY_MINUTE   => 'thirty_minute',
            HOUR            => 'hour',
            DAY             => 'day',
            WEEK            => 'week',
            MONTH           => 'month',
            QUARTER         => 'quarter',
            YEAR            => 'year',
        },
        Aggregators => {
            COUNT           => 'count',
            LONG_SUM        => 'longSum',
            DOUBLE_SUM      => 'doubleSum',
            DOUBLE_MIN      => 'doubleMin',
            DOUBLE_MAX      => 'doubleMax',
            LONG_MIN        => 'longMin',
            LONG_MAX        => 'longMax',
            DOUBLE_FIRST    => 'doubleFirst',
            DOUBLE_LAST     => 'doubleLast',
            LONG_FIRST      => 'longFirst',
            LONG_LAST       => 'longLast',
        },
        ArthimeticPostAggregator => {
            SUM             => '+',
            MINUS           => '-',
            MULTIPLY        => '*',
            DIVIDE          => '/',
            QUOTIENT        => 'quotient',
        },
        QueryContext => {
            TIMEOUT             => 'timeout',
            PRIORITY            => 'priority',
            QUERY_ID            => 'queryId',
            USE_CACHE           => 'useCache',
            POPULATE_CACHE      => 'populateCache',
            BY_SEGMENT          => 'bySegment',
            FINALIZE            => 'finalize',
            CHUNK_PERIOD        => 'chunkPeriod',
            SKIP_EMPTY_BUCKETS  => 'skipEmptyBuckets',
        }
    );
}


our %EXPORT_TAGS = ( map { $_ => [ keys %{ $constants{$_} } ] } keys %constants );
$EXPORT_TAGS {ALL} = [map {keys %$_} values %constants];
our @EXPORT_OK = ( map { keys %$_ } values %constants );

my %scalars;
BEGIN {
    @scalars{ keys %constants } = map {
        my %h = %$_;
        while ( my ( $k, $v ) = each %h ) { delete $h{$k} if !defined $v }
        \%h
    } values %constants;

    for my $constant_group (keys %scalars) {
        for my $k (keys %{ $scalars{$constant_group} }) {
            no strict 'refs';
            my $v = $scalars{$constant_group}->{$k};
            *$k = sub () { $v };
        }
    }
}

1;