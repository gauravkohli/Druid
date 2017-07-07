package Druid::Util;

use DateTime;

# Exporter settings
require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw();
our @EXPORT_OK = qw(
    iso8601_yyyy_mm_dd_hh_mm_ss
    yyyy_mm_dd_hh_mm_ss_iso8601
);

sub iso8601_yyyy_mm_dd_hh_mm_ss {
    my $iso_date = shift;

    if( $iso_date =~ m/^([0-9]{4})-([0-9]{2})-([0-9]{2})T([0-9]{2}):([0-9]{2}):([0-9]{2}).([0-9]{3})Z$/ ){
        return  sprintf '%s-%02d-%02d %02d:%02d:%02d', $1, $2, $3, $4, $5, %6;
    } else {
        die "\'$iso_date\' not a valid ISO8601 format.\n";
    }
}


sub yyyy_mm_dd_hh_mm_ss_iso8601 {
    my $yyyy_mm_dd_hh_mm_ss = shift;

    if( $yyyy_mm_dd_hh_mm_ss =~ m/^([0-9]{4})-?([0-9]{2})-?([0-9]{2})\s*([0-9]{2}):?([0-9]{2}):?([0-9]{2})$/ ){
        return  sprintf '%s-%02d-%02dT%02d:%02d:%02d', $1, $2, $3, $4, $5, %6;
    } else {
        die "\'$yyyy_mm_dd_hh_mm_ss\' not a valid YYYYMMDDHHMMSS or YYYY-MM-DD HH:MM:SS format.\n";
    }
}

1;
