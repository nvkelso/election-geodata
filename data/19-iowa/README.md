# Iowa

The available Iowa precinct data does not include county
assignments. The Makefile performs this assignment by joining to a
separate county boundary shapefile and assigning precincts to the
county that contains the largest proportion of their area. In
practice, each precinct is contained entirely by one county, so the
assignments are quite good.

Unfortunately, the Iowa precinct data has no unique column. It's not
clear what the best way to label Iowa precincts is.

County data comes from the US Census 2016 update:

    https://catalog.data.gov/dataset/tiger-line-shapefile-2016-state-iowa-current-county-subdivision-state-based

