# Delaware

## Election Geodata

- **2012** from [the state](http://opendata.firstmap.delaware.gov/datasets/delaware-election-boundaries)
    - Downloaded 2017-08-04.
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
      - G16PREDCli - Hillary Clinton (Democratic Party)
      - G16PRERTru - Donald J. Trump (Republican Party)
      - G16PREGSte - Jill Stein (Green Party)
      - G16PRELJoh - Gary Johnson (Libertarian Party)
    - Governor
      - G16GOVDCar - John Carney (Democratic Party)
      - G16GOVRBon - Colin Bonini (Republican Party)
      - G16GOVGGro - Andrew Groff (Green Party)
      - G16GOVLGow - Sean Louis Goward (Libertarian Party)
    - Lieutenant Governor
      - G16LTGDHal - Bethany Hall-Long (Democratic Party)
      - G16LTGRGun - La Mar Gunn (Republican Party)
  - Election results from [Delaware Department of Elections](https://elections.delaware.gov/archive/elect16/elect16_general/html/index.shtml)
  - Precinct shapefile from [State of Delaware's FirstMap](http://opendata.firstmap.delaware.gov/datasets/delaware-election-boundaries)
  - Precincts 17-02, 16-31, and 16-41 are the reporting units for UOCAVA votes (for New Castle, Kent, and Sussex Counties, respectively). These have no actual geography and the votes reported were not distributed to other precincts.
  - Precinct 13-02 appears in the shapefile, but not in election returns. However, the POPULATION column which came supplied in the shapefile reports 0 population.
  - Though the shapefile is labeled as the 2012 version, personal communication with the state office confirms that these will be in place throughout the decade.

## Additional Boundary Geodata

- **2016** Delaware county outlines pulled from [TIGER census project](https://catalog.data.gov/dataset/tiger-line-shapefile-2016-state-delaware-current-county-subdivision-state-based)
  - Note that TIGER file contains historical court district outlines, which roll up to counties.

