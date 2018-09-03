# Florida

- **2010** US Census
    - Downloaded 2017-03-11.
- **2016** county files from Florida Secretary of State
    - via FOIA request and DVD delivery, email sent to DivElections@dos.myflorida.com
    - precinct polling place locations data as of 9.19.16
    - Shapefiles come per county, Makefile stitches them into state-wide file
    - Data uploaded from DVD on 2017-03-21
- **2016** precincts with election results. Citation: _Florida Election Science Team, 2018, "2016 Precinct-Level Election Results", [https://doi.org/10.7910/DVN/NH5S2I](https://doi.org/10.7910/DVN/NH5S2I), Harvard Dataverse, V2._
  - Downloaded and posted on 2018-08-22 by [Will Adler](https://github.com/wtadler), [Princeton Gerrymandering Project](http://gerrymander.princeton.edu/)
  - Columns reporting votes follow a standard label pattern. For example, **G16PREDCli**:
    - Character 1 is G for a general election, P for a primary.
    - Characters 2 and 3 are the year of the election.
    - Characters 4–6 represent the office type:
      - GOV - Governor
      - H## - U.S. House, where ## is the district number. AL: at large.
      - LTG - Lieutenant Governor
      - PRE - President
      - PSC - Public Service Commission
      - RRC - Railroad Commissioner
      - USS - U.S. Senate
      - Character 7 represents the party of the candidate, such as D and R. See below for specific codes; note that third-party candidates may appear on the ballot under different party labels in different states.
      - Characters 8–10 are the first three letters of the candidate's last name.
  - Other codes:
    - President
      - G16PRERTru - Donald J. Trump (Republican Party)
      - G16PREDCli - Hillary Clinton (Democratic Party)
      - G16PRELJoh - Gary Johnson (Libertarian Party)
      - G16PRECCas - Darrell L. Castle (Constitution Party)
      - G16PREGSte - Jill Stein (Green Party)
      - G16PREIDeL - Roque De La Fuente (Reform Party)
      - G16PREOth - Write-in Votes
    - U.S. Senate
      - G16USSRRub - Marco Rubio (Republican Party)
      - G16USSDMur - Patrick Murphy (Democratic Party)
      - G16USSLSta - Paul Stanton (Libertarian Party)
      - G16USSOth - Independent and Write-in Votes
  - Election results from [Florida Division of Elections](http://dos.myflorida.com/elections/data-statistics/elections-data/precinct-level-election-results/)
  - Precinct shapefile from many sources. The starting point was the Orlando Sentinel's [precinct map](http://interactive.orlandosentinel.com/elections/2016/presidential-primary/results/dem.html) for the 2016 presidential primary. Hillsborough, Lake, Miami-Dade, Orange, Palm Beach, and Pinellas Counties were updated directly with shapefiles downloaded from county Supervisor of Elections websites. Brevard, Marion, and Putnam Counties were updated with KML files from the respective county Supervisor of Elections websites, from their election result map pages. DeSoto, Leon, Polk, and Osceola Counties updates received from Supervisor of Elections websites through personal contact. Highlands, Santa Rosa, Sarasota, and Volusia Counties had some precinct mergers, which were determined based on visual inspection of PDF precinct maps from the county websites. Jefferson County changed its precincts, but no map could be procured. As a last resort, the 2016 voter registration file was geocoded. Census blocks were assigned to precincts based on where voters fell, with best guesses made in blocks with no voters. Hernando 99, Collier 450, and Palm Beach 8001/8002 are UOCAVA precincts with no real geography and votes were not redistributed. Precinct names were adjusted to align with the formatting used in the voter registration file (e.g., some precincts have leading spaces).

## Florida County FIPS codes

County | FIPS | Population
------ | ---- | ----------
Alachua County | 001 | 249365
Baker County | 003 | 27154
Bay County | 005 | 169856
Bradford County | 007 | 28255
Brevard County | 009 | 543566
Broward County | 011 | 1780172
Calhoun County | 013 | 14750
Charlotte County | 015 | 160511
Citrus County | 017 | 140031
Clay County | 019 | 192370
Collier County | 021 | 328134
Columbia County | 023 | 67485
DeSoto County | 027 | 34894
Dixie County | 029 | 16486
Duval County | 031 | 870709
Escambia County | 033 | 299114
Flagler County | 035 | 97376
Franklin County | 037 | 11596
Gadsden County | 039 | 46151
Gilchrist County | 041 | 17004
Glades County | 043 | 12635
Gulf County | 045 | 15844
Hamilton County | 047 | 14671
Hardee County | 049 | 27887
Hendry County | 051 | 39089
Hernando County | 053 | 173094
Highlands County | 055 | 98630
Hillsborough County | 057 | 1267775
Holmes County | 059 | 19873
Indian River County | 061 | 138894
Jackson County | 063 | 49292
Jefferson County | 065 | 14658
Lafayette County | 067 | 8942
Lake County | 069 | 301019
Lee County | 071 | 631330
Leon County | 073 | 277971
Levy County | 075 | 40156
Liberty County | 077 | 8314
Madison County | 079 | 19115
Manatee County | 081 | 327142
Marion County | 083 | 332529
Martin County | 085 | 147495
Miami-Dade County | 086 | 2662874
Monroe County | 087 | 73873
Nassau County | 089 | 74195
Okaloosa County | 091 | 183482
Okeechobee County | 093 | 40140
Orange County | 095 | 1169107
Osceola County | 097 | 276163
Palm Beach County | 099 | 1335187
Pasco County | 101 | 466457
Pinellas County | 103 | 917398
Polk County | 105 | 609492
Putnam County | 107 | 74041
St. Johns County | 109 | 195823
St. Lucie County | 111 | 280379
Santa Rosa County | 113 | 154104
Sarasota County | 115 | 382213
Seminole County | 117 | 425071
Sumter County | 119 | 97756
Suwannee County | 121 | 41972
Taylor County | 123 | 22691
Union County | 125 | 15388
Volusia County | 127 | 494804
Wakulla County | 129 | 30978
Walton County | 131 | 55793
Washington County | 133 | 24935
