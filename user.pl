use strict;
use warnings;
use IO::Socket;

my $s = new IO::Socket::INET( PeerAddr => 'localhost',
							  PeerPort => 3000,
							  Proto    => 'tcp' );

die "IO::Socket : $!" unless $s;

print <$s>;
close( $s );