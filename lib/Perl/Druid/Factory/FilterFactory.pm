package Perl::Druid::Factory::FilterFactory;
use Moo;

use Perl::Druid::Filter::Regex;
use Perl::Druid::Filter::Selector;
use Perl::Druid::Filter::Logical::And;
use Perl::Druid::Filter::Logical::Or;
use Perl::Druid::Filter::Logical::Not;

sub selectorFilter {
   my $self = shift;
   my ( $dimension, $value) = @_;

   return Perl::Druid::Filter::Selector->new(
		dimension	=>	$dimension,
		value		=>	$value
	);
}

sub regexFilter {
   my $self = shift;
   my ( $dimension, $pattern) = @_;

   return Perl::Druid::Filter::Regex->new(
		dimension	=>	$dimension,
		pattern		=>	$pattern
	);
}

sub andFilter {
	my $self = shift;
	my $fields = shift;

	return Perl::Druid::Filter::Logical::And->new(
		fields		=>	 $fields
	);
}

sub orFilter {
	my $self = shift;
	my $fields = shift;

	return Perl::Druid::Filter::Logical::Or->new(
		fields		=>	 $fields
	);
}

sub notFilter {
	my $self = shift;
	my $fields = shift;

	return Perl::Druid::Filter::Logical::Not->new(
		fields		=>	 $fields
	);
}

1;
