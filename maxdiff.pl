#!/usr/bin/perl
open(RULE,"rule.dat") or die"No File\n";
while($a=<RULE>)
{
chomp $a;
@r = split(/\|/, $a);
# print "$a \n";
if (eval $r[1]){
 eval $r[2];
}
}
close(RULE);

exit;

sub max_diff{
#	my ($max) = @_;
open(FILE1,"Sina-Sohu.txt") or die"No File\n";

<FILE1>;
$max = 0;
while($temp=<FILE1>)
{
	chomp $temp;
	@t=split("\t",$temp);
	$x1=$t[2]-$t[3];
	if ($x1 > $max){
		$max = $x1;
		$date = $t[0];
		$min = $t[1];
	}
}
close(FILE1) or die"No close";
return (1) if $max;
}

sub show_out{
print "Max: \$" . $max . " on Date: $date at Minute: $min\n";
}

