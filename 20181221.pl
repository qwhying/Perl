#!/usr/bin/perl

open(RULE,"rule1.dat") or die"No File\n";
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

sub max_diff
{
open(INFILE, "Sina-Sohu.txt") or die "Cannot open $ARGV[0]: $!.\n";
<INFILE>;
$i=0;
$diffmax1=0;
$diffmax1=0;
while($a= <INFILE>)
{
	chomp $a;
	@X=split(/\t/,$a);
	$data[$i]=$X[0];
	$Time[$i]=$X[1];
	$sina[$i]=$X[2];
	$sohu[$i]=$X[3];
	if($diffmax1<$sina[$i]-$sohu[$i]&&$i<=293)
	{
		$diffmax1=$sina[$i]-$sohu[$i];
		$oneQuestion{$diffmax1}=$data[$i]."\t".$Time[$i];
	}
	else {if ($diffmax2 < $sina[$i] - $sohu[$i]) {
		$diffmax2 = $sina[$i] - $sohu[$i];
		$oneQuestion{$diffmax2} = $data[$i] . "\t" . $Time[$i];
	}
	}
	$i++;
}
close INFILE;
return 1;
}
sub show_out1
{
open(OUTFILE,">>result.txt");
print OUTFILE "\t日期\t时间\t差值/比例";
	print OUTFILE "\n";
	print OUTFILE "the max of difference in the first day is".$oneQuestion{$diffmax1}."\t".$diffmax1;
	print OUTFILE "the max of difference in the second day is".$oneQuestion{$diffmax2}."\t".$diffmax2;
print OUTFILE "\n"."************************************\n";
return 1;
}
