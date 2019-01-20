#!/usr/bin/perl
use warnings FATAL => 'all';

#
# This script takes a file name, opens the file, and prints the
# contents.
#
#if($#ARGV != 0) {
#    print STDERR "You must specify exactly one argument.\n";
#   exit 4;
#}
sub min {
    @mylist = @_;
    $min=$mylist[0];
    foreach $item(@_)
    {
        if($min>$item)
        {
            $min=$item;
        }
    }
    $min;
}
sub max{
    my @mylist=@_;
    my $max=$mylist[0];
    foreach my $item(@_)
    {
        if($max<$item)
        {
            $max=$item;
        }
    }
     $max;
}
# Open the file.
open(INFILE,"Sina-Sohu.txt") or die "Cannot open $ARGV[0]: $!.\n";
<INFILE>;
=pod
my @Date;
my @PriceRatio;
my @PriceMargin;
my @Time;
my %hashpm;
my %hashpr;
=cut
my $num=0;

while( $l = <INFILE>) {

    chomp $l;
     @a=split (/\t/,$l);
    #my $date="$a[0]";
    #my $time=substr($a[1],0,4);
     $pricemargin=$a[2]-$a[3];
     $priceratio=$a[2]/$a[3];
     $Date[$num]=$a[0];
     $Time[$num]=$a[1];
     $Sina[$num]=$a[2];
     $Sohu[$num]=$a[3];
     $PriceMargin[$num]=$pricemargin;
     $PriceRatio[$num]=$priceratio;
    $hashpm{$pricemargin}="$a[0]\t$a[1]";
    $hashpr{$priceratio}="$a[0]\t$a[1]";
    #$PriceMargin{$date}{$time}=$pricemargin;
    #$PriceRatio{$date}{$time}=$priceratio;
    $num=$num+1;
    #print "$a[2]-$a[3]=",$a[2]-$a[3],"\n";
}
$maxsina=max(@Sina);
$minsina=min(@Sina);
$maxsohu=max(@Sohu);
$minsohu=min(@Sohu);
$maxfluctsina=$maxsina-$minsina;
$maxfluctsohu=$maxsohu-$minsohu;
print $maxfluctsina," ",$maxfluctsohu,"\n";
$ratiofluct=$maxfluctsina/$maxfluctsohu;
print $ratiofluct,"\n";
$i=0;
$min=$PriceMargin[$i];
while($Date[$i]=="120208")
{

    if($min>$PriceMargin[$i]) {
        $min = $PriceMargin[$i];
    }
    $i=$i+1;

}
$max=$PriceMargin[$i];
print $i;
while($Date[$i]=="120209")
{
    if($max<$PriceMargin[$i])
    {
        $max=$PriceMargin[$i];
    }
    $i=$i+1;
}
print $i;
print $min,"\n";
print "a";
print $i,"\n",$num;
=pod
my $maxpm=max(@PriceMargin);
$minpm=min(@PriceMargin);
print $maxpm,"\n";
print $hashpm{$maxpm},"\n";
my $maxpr=max(@PriceRatio);
print qq/$maxpr/;
print $maxpr,"\n";
print $hashpr{$maxpr},"\n";
print qq/$hashpr{$maxpr}/;
close INFILE;
=pod
my $i09=0;
while($Date[$i09]=="120208"){
    $i09++;
}
my $i=0;
my @changepm;
my @changepr;
while($i<($num-1))
{
    $changepm[$i]=$PriceMargin[$i+1]-$PriceMargin[$i];
    $changepr[$i]=$PriceRatio[$i+1]-$PriceRatio[$i];
}
=pod 注释
my @maxMargintime;
my $maxMargin=$PriceMargin{"120208"}{"8450"};
my $maxRatio=$PriceRatio{"120208"}{"8450"};
foreach my $key (keys %PriceMargin)
{
    print "$key:\n";
    my $subhash=$PriceMargin{$key};
    foreach my $subkey(keys %$subhash)
    {
        if($maxMargin<=$$subhash{$subkey}){
            $maxMargin=$$subhash{$subkey};
            $maxMargintime[0]=$key;
            $maxMargintime[1]=$subkey;
        }
        print "$$subhash{$subkey} ";
    }
    print "\n"
}
foreach my $key (keys %PriceMargin)
{
    print "$key:\n";
    my $subhash=$PriceMargin{$key};
    foreach my $subkey(keys %$subhash)
    {
        if($maxMargin<=$$subhash{$subkey}){
            $maxMargin=$$subhash{$subkey};
            $maxMargintime[0]=$key;
            $maxMargintime[1]=$subkey;
        }
        print "$$subhash{$subkey} ";
    }
    print "\n"
}
=cut


