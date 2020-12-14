use strict;
use warnings;
use IO::Socket;
use Time::Piece;

my $t = localtime;
my $daytime = $t->strftime('%Y-%m-%d %H:%M:%S');

my $s = new IO::Socket::INET(
    PeerAddr => 'localhost',
    PeerPort => 3000,
    Proto    => 'tcp'
);

die "IO::Socket : $!" unless $s;

print <$s> . $daytime . "\n";
close($s);
