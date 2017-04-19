package Perl::Druid::Util;

use DateTime;

sub iso8601_yyyy_mm_dd_hh_mm_ss {
	my $self	 = shift;
	my $iso_date = shift;
	
	if( $iso_date =~ m/^([0-9]{4})-([0-9]{2})-([0-9]{2})T([0-9]{2}):([0-9]{2}):([0-9]{2}).([0-9]{3})Z$/ ){
		return  sprintf '%s-%02d-%02d %02d:%02d:%02d', $1, $2, $3, $4, $5, %6;
	} else {
		die $self. " not a valid ISO8601 format.\n";
	}

}

1;