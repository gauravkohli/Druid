package Perl::Druid;


use Moo;
use JSON;
use LWP::UserAgent;
use HTTP::Request;
use Perl::Druid::Util;

our $VERSION = '0.001';

has api_url => (is	=> 'ro');

has _ua    	=> (is => 'rwp', lazy => 1);
has _req    => (is => 'rwp', lazy => 1);

sub _set_ua		{ $_[0]->{_ua}    = $_[1] }
sub _set_req	{ $_[0]->{_req } = $_[1] }

sub BUILD {
    my $self = shift;
    
    my $ua	= LWP::UserAgent->new();
    my $req	= HTTP::Request->new( 'POST' => $self->api_url );

    $ua->ssl_opts( verify_hostname => 0 );
    $req->header( 'Content-Type' => 'application/json' );
    
    $self->_set_ua( $ua );
    $self->_set_req( $req );
}

sub send {
	my $self = shift;
	my $query = shift;
	
	my $request_hash = $query->gen_query;
    my $request_json = encode_json( $request_hash );

    $self->_req->content( $request_json );

    my $res = $self->_ua->request( $self->_req );	

    my $response;
    if ($res->is_success) {
        eval {
            $response = decode_json($res->content) if $res->content ne "";
            map { 
            	$_->{'timestamp'} =  Perl::Druid::Util->iso8601_yyyy_mm_dd_hh_mm_ss($_->{'timestamp'}) 
            } @{$response};
            1;
        } or do {
        	 warn "error: $@";
        }
    }
}

1;

__END__

=head1 NAME

PerlDruid - The great new PerlDruid!

=head1 VERSION

Version 0.001

=cut

our $VERSION = '0.001';
	
=head1 AUTHOR

Gaurav Kohli, C<< <gaurav.in at gmail.com> >>


=head1 LICENSE AND COPYRIGHT

Copyright 2017 Gaurav Kohli.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of PerlDruid
