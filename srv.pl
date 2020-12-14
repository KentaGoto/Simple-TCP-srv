use strict;
use warnings;
use IO::Socket;

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
    print "Connect.\n";
    $c->print("Alive: ");
    $c->close;
}

$s->close;
