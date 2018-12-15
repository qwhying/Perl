


sub max
{
	@data=@_;
	$k=$data[0];
	foreach(@data)
	{
		if($k<$_)
		{
			$k=$_;
		}
			
	}
	return $k;
}
sub min
{
	@data=@_;
	$k=$data[0];
	foreach(@data)
	{
		if($k>$_)
		{
			$k=$_;
		}
			
	}
	return $k;
}


# Open the file.
open(INFILE, "Sina-Sohu.txt") or die "Cannot open $ARGV[0]: $!.\n";


$string=<INFILE>;
$i=0;
while($a= <INFILE>) 
{	
	chomp $a;
	@X=split(/\t/,$a);
	$data[$i]=$X[0];

	$Time[$i]=$X[1];
	$sina[$i]=$X[2];
	$sohu[$i]=$X[3];
	$i++;
}
close INFILE;


$size=@data;
for($j=0;$j<$size;$j++)
{
	$diff=$sina[$j]-$sohu[$j];
	$differenceValue{$diff}=$data[$j]."\t".$Time[$j];
	$rate=$sina[$j]/$sohu[$j];
	$rateValue{$rate}=$data[$j]."\t".$Time[$j];
}
@diffkeys=keys%differenceValue;
$diffkey=max(@diffkeys);
#print "The maxiture of difference in both:",$diffkey,"\n";
#print "*********Time:",$differenceValue{$diffkey},"\n";
@ratekeys=keys%rateValue;
$ratekey=max(@ratekeys);
#print "The maxiture of ratio in both:",$ratekey,"\n";
#print "*********Time:",$rateValue{$ratekey},"\n";



for($k1=0,$k2=0,$m=0,$rateChange=0,$diffChange=0;$m<$size-1;$m++)
{
	
	if($diffChange<($diffkeys[$m+1]-$diffkeys[$m]))
	{
		$diffChange=$diffkeys[$m+1]-$diffkeys[$m];
		$k1=$m;
	}
	if($rateChange<($ratekeys[$m+1]-$ratekeys[$m]))
	{
		$rateChange=$ratekeys[$m+1]-$ratekeys[$m];
		$k2=$m;
	}
}
#print "the most of changes of difference in 1 minute:",$diffkeys[$k1],"\n";
#print "*********Time:",$differenceValue{$diffkeys[$k1]},"\n";
#print "the most of changes of ratio in 1 minute:",$ratekeys[$k2],"\n";
#print "*********Time:",$rateValue{$ratekeys[$k2]},"\n";

$subSize=$size/2;
$temp=0;
$k=0;
for($i=0;$i<$subSize;$i++)
{
	
	if($temp<$diffkeys[$i]-$diffkeys[$i+$subSize])
	{
		$temp=$diffkeys[$i]-$diffkeys[$i+$subSize];
		$k=$i;
	}
	
}
open(OUTFILE,">>result.txt");
print OUTFILE "����\tʱ��\t��ֵ/����";
print OUTFILE "\n";
print OUTFILE $differenceValue{$diffkey}."\t".$diffkey;
print OUTFILE "\n";
print OUTFILE $rateValue{$ratekey}."\t".$ratekey;
print OUTFILE "\n"."************************************\n";
print OUTFILE $differenceValue{$diffkeys[$k1]}."\t".$diffkeys[$k1];
print OUTFILE "\n";
print OUTFILE $rateValue{$ratekeys[$k2]}."\t".$ratekeys[$k2];
print OUTFILE "\n"."************************************\n";
print OUTFILE $differenceValue{$diffkeys[$k]}."\t".$diffkeys[$k];
print OUTFILE "\n";
print OUTFILE $differenceValue{$diffkeys[$k+$subSize]}."\t".$diffkeys[$k+$subSize];
print OUTFILE "\n"."************************************\n";

















