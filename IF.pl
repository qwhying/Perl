sub max_diff
{
open(INFILE, "Sina-Sohu.txt") or die "Cannot open $ARGV[0]: $!.\n";
<INFILE>;
$i=0;
$diffmax=0;
$ratemax=0;
$waveDiffamx=0;
$waveRatemax=0;
while($a= <INFILE>) 
{	
	chomp $a;
	@X=split(/\t/,$a);
	$data[$i]=$X[0];
	$Time[$i]=$X[1];
	$sina[$i]=$X[2];
	$sohu[$i]=$X[3];
	if($diffmax<$sina[$i]-$sohu[$i])
	{
		$diffmax=$sina[$i]-$sohu[$i];
		$oneQuestion{$diffmax}=$data[$i]."\t".$Time[$i];
	}
	$i++;
}
close INFILE;

}
sub show_out1
{
open(OUTFILE,">>result.txt");
print OUTFILE "\t日期\t时间\t差值/比例";
print OUTFILE "\n";
print OUTFILE "the max of difference is".$oneQuestion{$diffmax}."\t".$diffmax;	
}
sub max_rate
{
	open(INFILE, "Sina-Sohu.txt") or die "Cannot open $ARGV[0]: $!.\n";

<INFILE>;
$i=0;
$diffmax=0;
$ratemax=0;
$waveDiffamx=0;
$waveRatemax=0;
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
}

close INFILE;

open(OUTFILE,">>result.txt");
print OUTFILE "\t日期\t时间\t差值/比例";
print OUTFILE "\n";

print OUTFILE "the max of rate  is".$twoQuestion{$ratemax}."\t".$ratemax;
print OUTFILE "\n"."************************************\n";
}
sub show_out2
{
	open(OUTFILE,">>result.txt");
print OUTFILE "\t日期\t时间\t差值/比例";
print OUTFILE "\n";

print OUTFILE "the max of rate  is".$twoQuestion{$ratemax}."\t".$ratemax;
print OUTFILE "\n"."************************************\n";
}
sub max_in_one_minute
{
	open(INFILE, "Sina-Sohu.txt") or die "Cannot open $ARGV[0]: $!.\n";

<INFILE>;
$i=0;
$diffmax=0;
$ratemax=0;
$waveDiffamx=0;
$waveRatemax=0;
while($a= <INFILE>) 
{	
	chomp $a;
	@X=split(/\t/,$a);
	$data[$i]=$X[0];
	$Time[$i]=$X[1];
	$sina[$i]=$X[2];
	$sohu[$i]=$X[3];
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


}
sub show_out3
{
	
open(OUTFILE,">>result.txt");
print OUTFILE "\t日期\t时间\t差值/比例";
print OUTFILE "\n";
print OUTFILE "max_in_one_minute of diff is".$threeQuestion1{$waveDiffamx}."\t".$waveDiffamx;
print OUTFILE "\n";
print OUTFILE "max_in_one_minute of rate is".$threeQuestion2{$waveRateamx}."\t".$waveRateamx;
print OUTFILE "\n"."************************************\n";
}
sub max_between_twodays
{
	
# Open the file.
open(INFILE, "Sina-Sohu.txt") or die "Cannot open $ARGV[0]: $!.\n";

<INFILE>;
$i=0;
$diffmax=0;
$ratemax=0;
$waveDiffamx=0;
$waveRatemax=0;
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


}
sub show_out4
{
	open(OUTFILE,">>result.txt");
print OUTFILE "\t日期\t时间\t差值/比例";
print OUTFILE "\n";

print OUTFILE "the first time is".$fourQuestio1{$oneday}."\t".$oneday;
print OUTFILE "\n";
print OUTFILE "the first time is".$fourQuestion2{$twoday}."\t".$twoday;
print OUTFILE "\n"."************************************\n";
}


