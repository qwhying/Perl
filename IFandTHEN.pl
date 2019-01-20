open(RULE,"rule.dat") or die"No File\n";
	while($a=<RULE>) {
		chomp $a;
		@r = split(/\|/, $a);
		# print "$a \n";
		if (eval $r[1]) {
			$fact{$r[1]} = eval $r[2];

		}
	}
		close(RULE);
		exit;

		sub conclusion {
			$a="&max_diff";
			$b="&min_diff";
			@temp1=split(/\t/,$fact{$a});
			@temp2=split(/\t/,$fact{$b});
			$conclusion="$temp1[0]日的$temp1[1]时分建仓，并且在$temp2[0]日的$temp2[1]时分平仓";
			return 1;

		}
		sub print_conclusion
		{
			open(OUTFILE,">>result.txt")or die "Cannot open file!\n";
			print OUTFILE $conclusion;
		}
		sub max_diff
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
				if($diffmax<$sina[$i]-$sohu[$i])
				{
					$diffmax=$sina[$i]-$sohu[$i];
					$oneQuestion{$diffmax}=$data[$i]."\t".$Time[$i];
				}
				$i++;
			}
			close INFILE;
			return 1;
		}
		sub show_diffmax
		{

			return $oneQuestion{$diffmax}."\t".$diffmax;

		}
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
		sub show_maxrate
		{


			return $twoQuestion{$ratemax}."\t".$ratemax;
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
		sub show_max_in_one_minute
		{

			return $threeQuestion1{$waveDiffamx}."\t".$waveDiffamx;

		}

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
		sub show_max_between_twodays
		{
			open(OUTFILE,">>result.txt");
			print OUTFILE "\n\t日期\t时间\t差值/比例";
			print OUTFILE "\n";
			return $fourQuestio1{$oneday}."\t".$oneday."\n".$fourQuestion2{$twoday}."\t".$twoday;;
		}
		sub min_diff
		{
			open(INFILE, "Sina-Sohu.txt") or die "Cannot open $ARGV[0]: $!.\n";
			<INFILE>;
			$i=0;
			$diffmin=100;
			while($a= <INFILE>)
			{
				chomp $a;
				@X=split(/\t/,$a);
				$data[$i]=$X[0];
				$Time[$i]=$X[1];
				$sina[$i]=$X[2];
				$sohu[$i]=$X[3];
				if($diffmin>$sina[$i]-$sohu[$i])
				{
					$diffmin=$sina[$i]-$sohu[$i];
					$mindiff{$diffmin}=$data[$i]."\t".$Time[$i];
				}
				$i++;
			}
			close INFILE;
			return 1;
		}
		sub show_mindiff
		{
			return $mindiff{$diffmin}."\t".$diffmin;
		}
