package Perl::Druid::Factory::FilterFactory;
use Moo;

use Perl::Druid::Filter::SelectorFilter;
use Perl::Druid::Filter::Logical::AndFilter;

sub selectorFilter {
   my $self = shift;
   my ( $dimension, $value) = @_;
   
   return Perl::Druid::Filter::SelectorFilter->new(
		dimension	=>	$dimension,
		value		=>	$value
	);
}

sub andFilter {
	my $self = shift;
	my $fields = shift;
	
	return Perl::Druid::Filter::Logical::AndFilter->new(
		fields		=>	 $fields 
	);

}

1;