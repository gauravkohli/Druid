package Perl::Druid::Constants;

use strict;
use warnings;

use Exporter;
our @ISA = qw( Exporter );

my %constants;
BEGIN {
    %constants = (
        Granularity => {
            GRANULARITY_DAY             => 'day',
        },
        Aggregators => {
            AGGREGATOR_COUNT			=> 'count',
            AGGREGATOR_LONG_SUM			=> 'longSum',
            AGGREGATOR_DOUBLE_SUM		=> 'doubleSum',
            AGGREGATOR_DOUBLE_MIN		=> 'doubleMin',
            AGGREGATOR_DOUBLE_MAX		=> 'doubleMax',
            AGGREGATOR_LONG_MIN			=> 'longMin',
            AGGREGATOR_LONG_MAX			=> 'longMax',
            AGGREGATOR_DOUBLE_FIRST		=> 'doubleFirst',
            AGGREGATOR_DOUBLE_LAST		=> 'doubleLast',
            AGGREGATOR_LONG_FIRST		=> 'longFirst',
            AGGREGATOR_LONG_LAST		=> 'longLast',
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