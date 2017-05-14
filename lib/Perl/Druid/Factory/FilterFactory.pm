package Perl::Druid::Factory::FilterFactory;
use Moo;

use Perl::Druid::Filter::RegexFilter;
use Perl::Druid::Filter::SelectorFilter;
use Perl::Druid::Filter::Logical::AndFilter;
use Perl::Druid::Filter::Logical::OrFilter;
use Perl::Druid::Filter::Logical::NotFilter;

sub selectorFilter {
   my $self = shift;
   my ( $dimension, $value) = @_;

   return Perl::Druid::Filter::SelectorFilter->new(
		dimension	=>	$dimension,
		value		=>	$value
	);
}

sub regexFilter {
   my $self = shift;
   my ( $dimension, $pattern) = @_;

   return Perl::Druid::Filter::RegexFilter->new(
		dimension	=>	$dimension,
		pattern		=>	$pattern
	);
}

sub andFilter {
	my $self = shift;
	my $fields = shift;

	return Perl::Druid::Filter::Logical::AndFilter->new(
		fields		=>	 $fields
	);
}

sub orFilter {
	my $self = shift;
	my $fields = shift;

	return Perl::Druid::Filter::Logical::OrFilter->new(
		fields		=>	 $fields
	);
}

sub notFilter {
	my $self = shift;
	my $fields = shift;

	return Perl::Druid::Filter::Logical::NotFilter->new(
		fields		=>	 $fields
	);
}

1;