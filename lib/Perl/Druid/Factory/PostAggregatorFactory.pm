package Perl::Druid::Factory::PostAggregatorFactory;
use Moo;

use Perl::Druid::PostAggregator::Arithmetic;
use Perl::Druid::PostAggregator::Constant;
use Perl::Druid::PostAggregator::FieldAccess;


sub arithmetic {
   my $self = shift;
   my ( $name, $fn, $fields, $ordering) = @_;

   return Perl::Druid::PostAggregator::Arithmetic->new(
		name	 =>	$name,
		fn		 =>	$fn,
		fields	 => $fields,
		ordering => $ordering
	);
}

sub fieldAccess {
   my $self = shift;
   my ( $name, $fieldName) = @_;

   return Perl::Druid::PostAggregator::FieldAccess->new(
		name	  => $name,
		fieldName => $fieldName
	);
}

1;