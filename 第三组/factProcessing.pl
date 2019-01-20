#!/usr/bin/perl
sub factprocessing
{
    $CostTrend=$_[0];#cost trend 1 represents up -1 means down成本趋势1上升-1下降
    $ProfitTrend=$_[1];#profit trend 利润趋势
    $EarningMonths=$_[2];#the number of earning months in a year一年中正利润月数
    $Year=$_[3];#year 年份
    $LossMonths=12-$EarningMonths;#the number of loss months in a year一年中负利润月数
    open(OUTFILE,">>result.txt");
    if($ProfitTrend==1)#利润趋势上升
    {
        print OUTFILE $Year+"年公司利润总体上呈现上升趋势，业绩上升\n";
        if($EarningMonths<=5)
        {
            print OUTFILE "但是，盈利水平波动较大，一年中有$LossMonths"+"个月处于亏损状态，业绩上升有一定偶然性\n";
                if($CostTrend==1)
                {
                    print OUTFILE $Year+"年公司成本呈上升趋势，考虑市场不利的情况下，公司的经营还是有效的，但公司业绩上升偶然因素较大。\n";
                    print OUTFILE $Year+"年，市场变化很大，业务难度上升。"
                }
                else{
                    print OUTFILE $Year+"年公司成本呈下降趋势，有效的成本控制使公司保持良好盈利能力，但是多月业绩下滑预示着市场形势严峻\n";
                    print OUTFILE "或将面临市场带来的挑战。"

                }
        }
        else{
            print OUTFILE "市场较为平稳，公司一年中有$EarningMonths"+"个月实现盈利\n";
            if($CostTrend==1)
            {
                print OUTFILE $Year+"年公司成本呈上升趋势，但是基本在可控范围内，由于市场表现平稳，业绩仍能够较为平稳增长。"
            }
            else{
                print OUTFILE $Year+"年公司成本呈下降趋势，虽有小幅波动，但基本在可控范围内，业绩平稳增长，公司经营有效。"
            }
        }


    }
    else
    {
        if($ProfitTrend==-1)#利润趋势下降
        {

        }
        else#持平，或者出错
        {

        }
    }

}
