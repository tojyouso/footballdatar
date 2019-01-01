
<!-- README.md is generated from README.Rmd. Please edit that file -->
footballdatar
=============

The goal of footballdatar is to make it easy to use data from [football-data.co.uk]() in `R`.

Installation
------------

Currently only available on github (not sure it will ever get to CRAN tbh) and can be installed via:

``` r
devtools::install_github("tojyouso/footballdatar")
```

Examples
--------

### Get football data

Currently only downloads data for the EPL but this will be extended to the other European leagues soon. So for the 2017/2018 season use the following:

``` r
epl_2017 <- footballdatar::get_football_data(season = 2017)

epl_2017
#> # A tibble: 380 x 67
#>    Div   Date  HomeTeam AwayTeam  FTHG  FTAG FTR    HTHG  HTAG HTR  
#>    <chr> <chr> <chr>    <chr>    <int> <int> <chr> <int> <int> <chr>
#>  1 E0    11/0… Arsenal  Leicest…     4     3 H         2     2 D    
#>  2 E0    12/0… Brighton Man City     0     2 A         0     0 D    
#>  3 E0    12/0… Chelsea  Burnley      2     3 A         0     3 A    
#>  4 E0    12/0… Crystal… Hudders…     0     3 A         0     2 A    
#>  5 E0    12/0… Everton  Stoke        1     0 H         1     0 H    
#>  6 E0    12/0… Southam… Swansea      0     0 D         0     0 D    
#>  7 E0    12/0… Watford  Liverpo…     3     3 D         2     1 H    
#>  8 E0    12/0… West Br… Bournem…     1     0 H         1     0 H    
#>  9 E0    13/0… Man Uni… West Ham     4     0 H         1     0 H    
#> 10 E0    13/0… Newcast… Tottenh…     0     2 A         0     0 D    
#> # ... with 370 more rows, and 57 more variables: Referee <chr>, HS <int>,
#> #   AS <int>, HST <int>, AST <int>, HF <int>, AF <int>, HC <int>,
#> #   AC <int>, HY <int>, AY <int>, HR <int>, AR <int>, B365H <dbl>,
#> #   B365D <dbl>, B365A <dbl>, BWH <dbl>, BWD <dbl>, BWA <dbl>, IWH <dbl>,
#> #   IWD <dbl>, IWA <dbl>, LBH <dbl>, LBD <dbl>, LBA <dbl>, PSH <dbl>,
#> #   PSD <dbl>, PSA <dbl>, WHH <dbl>, WHD <dbl>, WHA <dbl>, VCH <dbl>,
#> #   VCD <dbl>, VCA <dbl>, Bb1X2 <int>, BbMxH <dbl>, BbAvH <dbl>,
#> #   BbMxD <dbl>, BbAvD <dbl>, BbMxA <dbl>, BbAvA <dbl>, BbOU <int>,
#> #   BbMx.2.5 <dbl>, BbAv.2.5 <dbl>, BbMx.2.5.1 <dbl>, BbAv.2.5.1 <dbl>,
#> #   BbAH <int>, BbAHh <dbl>, BbMxAHH <dbl>, BbAvAHH <dbl>, BbMxAHA <dbl>,
#> #   BbAvAHA <dbl>, PSCH <dbl>, PSCD <dbl>, PSCA <dbl>, season <dbl>,
#> #   league <chr>
```

### Clean football data

The package also contains a function to clean the data so all the column names are in snake case. Soon, I'll add functionality to set it so any case could be used by using the `janitor` package.

``` r
epl_2017_clean <- footballdatar::clean_football_data(epl_2017)

epl_2017_clean
#> # A tibble: 380 x 66
#>    league season date       home_team away_team  fthg  ftag ftr    hthg
#>    <chr>   <dbl> <date>     <chr>     <chr>     <int> <int> <chr> <int>
#>  1 E0       2017 2017-08-11 Arsenal   Leicester     4     3 H         2
#>  2 E0       2017 2017-08-12 Brighton  Man City      0     2 A         0
#>  3 E0       2017 2017-08-12 Chelsea   Burnley       2     3 A         0
#>  4 E0       2017 2017-08-12 Crystal … Huddersf…     0     3 A         0
#>  5 E0       2017 2017-08-12 Everton   Stoke         1     0 H         1
#>  6 E0       2017 2017-08-12 Southamp… Swansea       0     0 D         0
#>  7 E0       2017 2017-08-12 Watford   Liverpool     3     3 D         2
#>  8 E0       2017 2017-08-12 West Brom Bournemo…     1     0 H         1
#>  9 E0       2017 2017-08-13 Man Unit… West Ham      4     0 H         1
#> 10 E0       2017 2017-08-13 Newcastle Tottenham     0     2 A         0
#> # ... with 370 more rows, and 57 more variables: htag <int>, htr <chr>,
#> #   referee <chr>, hs <int>, as <int>, hst <int>, ast <int>, hf <int>,
#> #   af <int>, hc <int>, ac <int>, hy <int>, ay <int>, hr <int>, ar <int>,
#> #   b365h <dbl>, b365d <dbl>, b365a <dbl>, bwh <dbl>, bwd <dbl>,
#> #   bwa <dbl>, iwh <dbl>, iwd <dbl>, iwa <dbl>, lbh <dbl>, lbd <dbl>,
#> #   lba <dbl>, psh <dbl>, psd <dbl>, psa <dbl>, whh <dbl>, whd <dbl>,
#> #   wha <dbl>, vch <dbl>, vcd <dbl>, vca <dbl>, bb1x2 <int>,
#> #   bb_mx_h <dbl>, bb_av_h <dbl>, bb_mx_d <dbl>, bb_av_d <dbl>,
#> #   bb_mx_a <dbl>, bb_av_a <dbl>, bb_ou <int>, bb_mx_2_5 <dbl>,
#> #   bb_av_2_5 <dbl>, bb_mx_2_5_1 <dbl>, bb_av_2_5_1 <dbl>, bb_ah <int>,
#> #   bb_a_hh <dbl>, bb_mx_ahh <dbl>, bb_av_ahh <dbl>, bb_mx_aha <dbl>,
#> #   bb_av_aha <dbl>, psch <dbl>, pscd <dbl>, psca <dbl>
```

It also adds some helper columns like `season`.

### Transform from match level to team level

The final function is a helper function to convert the data from match level to team level. This allows for easy calculation of league points for example. It doubles the amount of rows as there will be two rows per match, one for each team and an indicator as to whether that team was home or away.

``` r
footballdatar::transform_to_team_level(epl_2017_clean)
#> # A tibble: 760 x 11
#>    date       team  opponent  home goals_scored goals_conceded shots_taken
#>    <date>     <chr> <chr>    <dbl>        <int>          <int>       <int>
#>  1 2017-08-11 Arse… Leicest…     1            4              3          27
#>  2 2017-08-11 Leic… Arsenal      0            3              4           6
#>  3 2017-08-12 Brig… Man City     1            0              2           6
#>  4 2017-08-12 Man … Brighton     0            2              0          14
#>  5 2017-08-12 Chel… Burnley      1            2              3          19
#>  6 2017-08-12 Burn… Chelsea      0            3              2          10
#>  7 2017-08-12 Crys… Hudders…     1            0              3          14
#>  8 2017-08-12 Hudd… Crystal…     0            3              0           8
#>  9 2017-08-12 Ever… Stoke        1            1              0           9
#> 10 2017-08-12 Stoke Everton      0            0              1           9
#> # ... with 750 more rows, and 4 more variables: shots_conceded <int>,
#> #   sot_taken <int>, sot_conceded <int>, points <dbl>
```
