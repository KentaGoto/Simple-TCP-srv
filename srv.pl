use strict;
use warnings;
use IO::Socket;
use Time::Piece;

my $t = localtime;
my $daytime = $t->strftime('%Y-%m-%d %H:%M:%S');

my $s = new IO::Socket::INET(
    Listen    => 5,
    LocalAddr => 'localhost',
    LocalPort => 3000,
    Proto     => 'tcp',
    Reuse     => 1
);

die "Error: $!" unless $s;
print "Running...\n";

while ( my $c = $s->accept ) {
    print "Connect: $daytime\n";
    $c->print("Alive: $daytime\n");
    $c->close;
}

$s->close;
