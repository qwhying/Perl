

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
=pod
sub max_rate
{
	open(INFILE, "Sina-Sohu.txt") or die "Cannot open $ARGV[0]: $!.\n";

<INFILE>;
$i=0;
$diffmax=0;
$ratemax=0;
while($a= <INFILE>) 
{	
	chomp $a;
	@X=split(/\t/,$a);
	$data[$i]=$X[0];
	$Time[$i]=$X[1];
	$sina[$i]=$X[2];
	$sohu[$i]=$X[3];
	if($ratemax<$sohu[$i]/$sina[$i])
	{
		$ratemax=$sohu[$i]/$sina[$i];
		$twoQuestion{$ratemax}=$data[$i]."\t".$Time[$i];
	}

	$i++;
	return 1;
}

close INFILE;

open(OUTFILE,">>result.txt");
print OUTFILE "\t日期\t时间\t差值/比例\n";
print OUTFILE "the max of rate  is".$twoQuestion{$ratemax}."\t".$ratemax;
print OUTFILE "\n"."************************************\n";
return 1;
}
sub show_out2
{
	open(OUTFILE,">>result.txt");
print OUTFILE "\n\t日期\t时间\t差值/比例";
print OUTFILE "\n";

print OUTFILE "the max of rate  is".$twoQuestion{$ratemax}."\t".$ratemax;
print OUTFILE "\n"."************************************\n";
return 1;
}

sub max_in_one_minute
{
	open(INFILE, "Sina-Sohu.txt") or die "Cannot open $ARGV[0]: $!.\n";

<INFILE>;
$i=0;
while($a=<INFILE>) 
{	
	$waveDiffamx=0;
	$waveRateamx=0;
	chomp $a;
	@X=split(/\t/,$a);
	$data[$i]=$X[0];
	$Time[$i]=$X[1];
	$sina[$i]=$X[2];
	$sohu[$i]=$X[3];
	$diff[$i]=$sina[$i]-$sohu[$i];
	$rate[$i]=$sohu[$i]/$sina[$i];
	if($i>1&&($waveDiffamx<abs($diff[$i]-$diff[$i-1])))
	{
		$waveDiffamx=abs($diff[$i]-$diff[$i-1]);
		$threeQuestion1{$waveDiffamx}=$data[$i]."\t".$Time[$i];
	}
	if($i>1&&($waveRateamx<abs($rate[$i]-$rate[$i-1])))
	{
		$waveRateamx=abs($rate[$i]-$rate[$i-1]);
		$threeQuestion2{$waveRateamx}=$data[$i]."\t".$Time[$i];
	}
	$i++;
	
}
return 1;

}
sub show_out3
{
	
open(OUTFILE,">>result.txt");
print OUTFILE "\n\t日期\t时间\t差值/比例";
print OUTFILE "\n";
print OUTFILE "max_in_one_minute of diff is".$threeQuestion1{$waveDiffamx}."\t".$waveDiffamx;
print OUTFILE "\n";
print OUTFILE "max_in_one_minute of rate is".$threeQuestion2{$waveRateamx}."\t".$waveRateamx;
print OUTFILE "\n"."************************************\n";
return 1;
}
=cut
=pod
sub max_between_twodays
{
open(INFILE, "Sina-Sohu.txt") or die "Cannot open $ARGV[0]: $!.\n";
<INFILE>;
$i=0;
$diffmax=0;
$ratemax=0;

while($a= <INFILE>) 
{	
	chomp $a;
	@X=split(/\t/,$a);
	$data[$i]=$X[0];
	$Time[$i]=$X[1];
	$sina[$i]=$X[2];
	$sohu[$i]=$X[3];
	$diff[$i]=$sina[$i]-$sohu[$i];
	$rate[$i]=$sohu[$i]/$sina[$i];
	$i++;
}
$size=$i;
$luan=0;
close INFILE;
for($i=0;$i<$size;$i++)
{
	if($data[$i]==120209)
	{
		last;
	}
	for($j=0;$j<$size;$j++)
	{
		if(($data[$j]==120209)&&(abs($Time[$i]-$Time[$j])<60)&&($luan<abs($diff[$i]-$diff[$j])))
		{
			$luan=abs($diff[$i]-$diff[$j]);
			$oneday=$diff[$i];
			$twoday=$diff[$j];
			$fourQuestio1{$oneday}=$data[$i]."\t".$Time[$i];
			$fourQuestion2{$twoday}=$data[$j]."\t".$Time[$j];
		}		
	}
	
}

return 1;
}
sub show_out4
{
open(OUTFILE,">>result.txt");
print OUTFILE "\n\t日期\t时间\t差值/比例";
print OUTFILE "\n";
print OUTFILE "the first time is".$fourQuestio1{$oneday}."\t".$oneday;
print OUTFILE "\n";
print OUTFILE "the first time is".$fourQuestion2{$twoday}."\t".$twoday;
print OUTFILE "\n"."************************************\n";
return 1;
}
=cut
sub min_diff
{
	open(INFILE, "Sina-Sohu.txt") or die "Cannot open $ARGV[0]: $!.\n";
	<INFILE>;
	$i=0;
	$diffmin1=0;
	$diffmin2=0;
	while($a= <INFILE>)
	{
		chomp $a;
		@X=split(/\t/,$a);
		$data[$i]=$X[0];
		$Time[$i]=$X[1];
		$sina[$i]=$X[2];
		$sohu[$i]=$X[3];
		if(($diffmin1>$sina[$i]-$sohu[$i])&&$i<=293)
		{
			$diffmin1=$sina[$i]-$sohu[$i];
			$oneQuestion{$diffmin1}=$data[$i]."\t".$Time[$i];
		}
		else {if ($diffmin2>$sina[$i] - $sohu[$i]) {
			$diffmin2 = $sina[$i] - $sohu[$i];
			$oneQuestion{$diffmin2} = $data[$i] . "\t" . $Time[$i];
		}
		}
		$i++;
	}
	close INFILE;
	return 1;

}
sub show_out2
{
	open(OUTFILE,">>result.txt");
	print OUTFILE "\t日期\t时间\t差值/比例";
	print OUTFILE "\n";
	print OUTFILE "the min of difference in the first day is".$oneQuestion{$diffmin1}."\t".$diffmin1;
	print OUTFILE "the min of difference in the second day is".$oneQuestion{$diffmin2}."\t".$diffmin2;
	print OUTFILE "\n"."************************************\n";
	return 1;
}
=pod
sub max_between_twodays
{
	open(INFILE, "Sina-Sohu.txt") or die "Cannot open $ARGV[0]: $!.\n";
	<INFILE>;
	$i=0;
	$diffmax=0;
	$ratemax=0;

	while($a= <INFILE>)
	{
		chomp $a;
		@X=split(/\t/,$a);
		$data[$i]=$X[0];
		$Time[$i]=$X[1];
		$sina[$i]=$X[2];
		$sohu[$i]=$X[3];
		$diff[$i]=$sina[$i]-$sohu[$i];
		$rate[$i]=$sohu[$i]/$sina[$i];
		$i++;
	}
	$size=$i;
	$luan=0;
	close INFILE;
	for($i=0;$i<$size;$i++)
	{
		if($data[$i]==120209)
		{
			last;
		}
		for($j=0;$j<$size;$j++)
		{
			if(($data[$j]==120209)&&(abs($Time[$i]-$Time[$j])<60)&&($luan<abs($diff[$i]-$diff[$j])))
			{
				$luan=abs($diff[$i]-$diff[$j]);
				$oneday=$diff[$i];
				$twoday=$diff[$j];
				$fourQuestio1{$oneday}=$data[$i]."\t".$Time[$i];
				$fourQuestion2{$twoday}=$data[$j]."\t".$Time[$j];
			}
		}

	}

	return 1;
}
=cut
sub diff_between_twodays
{
	max_diff;
	min_diff;
	$diff_in_max_diff=abs($diffmax1-$diffmax2);
	$diff_in_min_diff=abs($diffmin1-$diffmin2);
	return 1;
}
sub show_out3
{
	open(OUTFILE,">>result.txt");
	print OUTFILE "The difference of the maxdiff between two days is".$diff_in_max_diff;
	print OUTFILE "the difference of the mindiff between two days is".$diff_in_min_diff;
	print OUTFILE "\n"."************************************\n";
	return 1;
}