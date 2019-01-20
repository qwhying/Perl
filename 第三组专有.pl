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
	if($diffmax<$sina[$i]-$sohu[$i])
	{
		$diff[$i]=$diffmax;
		$diffmax=$sina[$i]-$sohu[$i];
		$oneQuestion{$diffmax}=$data[$i]."\t".$Time[$i];
	}
	if($ratemax<$sohu[$i]/$sina[$i])
	{
		$rate[$i]=$ratemax;
		$ratemax=$sohu[$i]/$sina[$i];
		$twoQuestion{$ratemax}=$data[$i]."\t".$Time[$i];
	}
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

open(OUTFILE,">>result.txt");
print OUTFILE "日期\t时间\t差值/比例";
print OUTFILE "\n";
print OUTFILE $oneQuestion{$diffmax}."\t".$diffmax;
print OUTFILE "\n";
print OUTFILE $twoQuestion{$ratemax}."\t".$ratemax;
print OUTFILE "\n"."************************************\n";
print OUTFILE $threeQuestion1{$waveDiffamx}."\t".$waveDiffamx;
print OUTFILE "\n";
print OUTFILE $threeQuestion2{$waveRateamx}."\t".$waveRateamx;
print OUTFILE "\n"."************************************\n";
print OUTFILE $fourQuestio1{$oneday}."\t".$oneday;
print OUTFILE "\n";
print OUTFILE $fourQuestion2{$twoday}."\t".$twoday;
print OUTFILE "\n"."************************************\n";







