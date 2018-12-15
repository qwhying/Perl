#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use strict;

#
# This script takes a file name, opens the file, and prints the
# contents.
#
#if($#ARGV != 0) {
#    print STDERR "You must specify exactly one argument.\n";
#   exit 4;
#}
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
my @Date;
my @PriceRatio;
my @PriceMargin;
my @Time;
my %hashpm;
my %hashpr;
my $num=0;
while(my $l = <INFILE>) {

    chomp $l;
    my @a=split (/\t/,$l);
    #my $date="$a[0]";
    #my $time=substr($a[1],0,4);
    my $pricemargin=$a[2]-$a[3];
    my $priceratio=$a[2]/$a[3];
     $Date[$num]=$a[0];
     $Time[$num]=$a[1];
     $PriceMargin[$num]=$pricemargin;
     $PriceRatio[$num]=$priceratio;
    $hashpm{$pricemargin}="$a[0]\t$a[1]";
    $hashpr{$priceratio}="$a[0]\t$a[1]";
    #$PriceMargin{$date}{$time}=$pricemargin;
    #$PriceRatio{$date}{$time}=$priceratio;
    $num++;
    #print "$a[2]-$a[3]=",$a[2]-$a[3],"\n";
}
print $Date[0];
print $num;
my $maxpm=max(@PriceMargin);
print $maxpm,"\n";
print $hashpm{$maxpm},"\n";
my $maxpr=max(@PriceRatio);
print $maxpr,"\n";
print $hashpr{$maxpr},"\n";
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


