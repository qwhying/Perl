#!/usr/bin/perl
use warnings;
# Prints the message using two different delimeters.
print "\"Hello\", world!\n";
print qq=Did you say "Hello?"\n=;
print qq+Did you say "Hello?"\n+;
# Shows how single quotes differ from double quotes used in hello.pl
print 'Greetings, small planet!\n';
print q/What's cooking?\n/;
print 'Greetings, small planet!\n',"\n";
print q-What's cooking?\n-,"\n";
# Various operations on scalar (string) variables.
$fred = "Fred here";
$barney = 56;
$sum = 10 + $barney;
print 'The variable $fred' . " contains $fred.\n";
print "Sum is $sum.\n";
# Simple array constructs.数组
@fred = ("How", "are", "you", "today?");#@表示数组
print "\@fred contains (@fred).\n";

$mike = $fred[1];
print "$mike $fred[3]\n";

# The array name in a scalar context gives the size.
$fredsize = @fred;
print '@fred has ', "$fredsize elements.\n";

# The $#name gives the max subscript (size less one).
print "Max sub is $#fred\n";
# Simple hash constructs
$frd{"with"} = "without";
$frd{"this"} = "that";
$frd{"mountain"} = "valley";
$frd{"left"} = "right";
$frd{"ad"}="adfadfadf";
$asd{"with"}="without";
print qq/$asd{"with"}\n/;
print qq/$frd{"this"}\n/;
print
@keys = keys(%fred);
print "Keys are @keys\n";
print "adsc"."\t"."adf";
print "adf"."fadf";
=pod
# Initializer for %yard.
%yard = ( red => 'brick',
    blue => 'sky',
    green => 'grass',
    yellow => 'dandelion' );
print "$yard{'blue'} $yard{'yellow'}\n";
use strict;

my $a = 5;
while($a > 0) {
    print "$a ";
    $a--;
}
print "\n";
use strict;

# Echo input to output.
while(my $fred = <STDIN>) {
    print $fred;
}
=cut