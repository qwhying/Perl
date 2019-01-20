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
    print OUTFILE "the max of difference in the first day is".$oneQuestion{$diffmax1}."\t".$diffmax1."\n";
    print OUTFILE "the max of difference in the second day is".$oneQuestion{$diffmax2}."\t".$diffmax2;
    print OUTFILE "\n"."************************************\n";
    return 1;
}
sub min_diff
{
    open(INFILE, "Sina-Sohu.txt") or die "Cannot open $ARGV[0]: $!.\n";
    <INFILE>;
    $i=0;
    $diffmin1=10000;
    $diffmin2=10000;
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
    print OUTFILE "the min of difference in the first day is".$oneQuestion{$diffmin1}."\t".$diffmin1."\n";
    print OUTFILE "the min of difference in the second day is".$oneQuestion{$diffmin2}."\t".$diffmin2;
    print OUTFILE "\n"."************************************\n";
    return 1;
}
sub diff_between_twodays
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
    open(INFILE, "Sina-Sohu.txt") or die "Cannot open $ARGV[0]: $!.\n";
    <INFILE>;
    $i=0;
    $diffmin1=10000;
    $diffmin2=10000;
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
    $diff_in_max_diff=abs($diffmax1-$diffmax2);
    $diff_in_min_diff=abs($diffmin1-$diffmin2);
    return 1;
}
sub show_out3
{
    open(OUTFILE,">>result.txt");
    print OUTFILE "The difference of the maxdiff between two days is".$diff_in_max_diff."\n";
    print OUTFILE "the difference of the mindiff between two days is".$diff_in_min_diff;
    print OUTFILE "\n"."************************************\n";
    print OUTFILE "可见，两天最高价差之差比最低价差之差大的多！";
    return 1;
}
