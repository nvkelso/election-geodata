# Texas

- **2010** from US Census
    - Downloaded 2017-03-11.
- **2014** from Texas state source via aaron-strauss
    - From https://github.com/aaron-strauss/precinct-shapefiles/tree/master/tx
    - ftp://ftpgis1.tlc.state.tx.us/2011_Redistricting_Data/Precincts/Geography/Precincts.zip
    - Downloaded 2017-03-11.
- **2016** from Texas state source
    - These are marked as 2011 on https://github.com/aaron-strauss/precinct-shapefiles/tree/master/tx
    - But opened them up shows metadata for 2016 (with last update in 2017)
    - They were re-downloaded fresh from Texas gov't site:
        - 2016 Precincts are here: ftp://ftpgis1.tlc.state.tx.us/2011_Redistricting_Data/Precincts/
        - 2016 VTDs are here: ftp://ftpgis1.tlc.state.tx.us/2011_Redistricting_Data/VTDs/
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
      - G16PRELJoh - Gary Johnson (Libertarian Party)
      - G16PREGSte - Jill Stein (Green Party)
      - G16PREOth - Write-in Votes
    - Railroad Commissioner
      - G16RRCDYar - Grady Yarbrough (Democratic Party)
      - G16RRCRChr - Wayne Christian (Republican Party)
      - G16RRCLMil - Mark Miller (Libertarian Party)
      - G16RRCGSal - Martina Salinas (Green Party)
  - Election results and precinct shapefile from [Texas Legislative Council](ftp://ftpgis1.tlc.state.tx.us/)



More at the [Texas Legislative Council](http://www.tlc.state.tx.us/redist/districts/senate.html).

Election results are managed by county clerks. For example, Harris County's results are in a difficult-to-parse PDF ([example](http://www.harrisvotes.com/ElectionResults.aspx)).

Submitted by @dkastner, thanks!