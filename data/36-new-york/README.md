# New York

## Statewide

- Census 2010

## Local areas

- Lots (though not all) counties from a statewide FOIL request: https://www.muckrock.com/foi/new-york-16/ny-state-election-district-shapefiles-for-past-elections-60752/
- NYC is Jan. 2017 (presumably used in 2016 election), downloaded 2017-03-14 (+ 2016 and 2014 from the FOIL)
    - http://www1.nyc.gov/site/planning/data-maps/open-data/districts-download-metadata.page
    - Coverage:
        - 061-new-york
        - 047-kings
        - 081-queens
        - 005-bronx
        - 085-richmond
    - NYC election district to county mapping done via the somewhat dank `generate-county-field.sh` script
- Erie (circa 2000, but it seems to have _more_ features than Census 2010 here so I suspect the metadata is wrong), downloaded 2017-03-14.
    - http://gis.ny.gov/gisdata/fileserver/?DSID=834&file=election_dist.zip
    - From: https://gis.ny.gov/gisdata/inventories/details.cfm?DSID=834
- Ontario from 5/2016, downloaded 2017-03-14.
    - http://www.co.ontario.ny.us/DocumentCenter/View/5629
    - From: http://www.co.ontario.ny.us/1150/GIS-Data-Resource-Center
- Rensselaer County (Troy, March 2016), downloaded 2017-03-14.
    - https://gis.ny.gov/gisdata/inventories/details.cfm?DSID=676

## Missing and/or future work

- Suffolk County (tried 2017-03-14 but no obvious download link)
    - http://gis3.suffolkcountyny.gov/VoterInformation/
    - http://suffolkcountyny.gov/Departments/GeographicInformationSystems/Maps.aspx
- Courtland County, but circa 1990?!
    - https://gis.ny.gov/gisdata/inventories/details.cfm?DSID=839
    - Manual request process
- City of New Rochelle
    - https://gis.ny.gov/gisdata/inventories/details.cfm?DSID=1194
    - Manual request process

## FIPS codes

County | FIPS Code | dirname
-------|-----------|---------
Albany | 001 | 001-albany
Allegany | 003 | 003-allegany
Bronx | 005 | 005-bronx
Broome | 007 | 007-broome
Cattaraugus | 009 | 009-cattaraugus
Cayuga | 011 | 011-cayuga
Chautauqua | 013 | 013-chautauqua
Chemung | 015 | 015-chemung
Chenango | 017 | 017-chenango
Clinton | 019 | 019-clinton
Columbia | 021 | 021-columbia
Cortland | 023 | 023-cortland
Delaware | 025 | 025-delaware
Dutchess | 027 | 027-dutchess
Erie | 029 | 029-erie
Essex | 031 | 031-essex
Franklin | 033 | 033-franklin
Fulton | 035 | 035-fulton
Genesee | 037 | 037-genesee
Greene | 039 | 039-greene
Hamilton | 041 | 041-hamilton
Herkimer | 043 | 043-herkimer
Jefferson | 045 | 045-jefferson
Kings | 047 | 047-kings
Lewis | 049 | 049-lewis
Livingston | 051 | 051-livingston
Madison | 053 | 053-madison
Monroe | 055 | 055-monroe
Montgomery | 057 | 057-montgomery
Nassau | 059 | 059-nassau
New York | 061 | 061-new-york
Niagara | 063 | 063-niagara
Oneida | 065 | 065-oneida
Onondaga | 067 | 067-onondaga
Ontario | 069 | 069-ontario
Orange | 071 | 071-orange
Orleans | 073 | 073-orleans
Oswego | 075 | 075-oswego
Otsego | 077 | 077-otsego
Putnam | 079 | 079-putnam
Queens | 081 | 081-queens
Rensselaer | 083 | 083-rensselaer
Richmond | 085 | 085-richmond
Rockland | 087 | 087-rockland
St. Lawrence | 089 | 089-st-lawrence
Saratoga | 091 | 091-saratoga
Schenectady | 093 | 093-schenectady
Schoharie | 095 | 095-schoharie
Schuyler | 097 | 097-schuyler
Seneca | 099 | 099-seneca
Steuben | 101 | 101-steuben
Suffolk | 103 | 103-suffolk
Sullivan | 105 | 105-sullivan
Tioga | 107 | 107-tioga
Tompkins | 109 | 109-tompkins
Ulster | 111 | 111-ulster
Warren | 113 | 113-warren
Washington | 115 | 115-washington
Wayne | 117 | 117-wayne
Westchester | 119 | 119-westchester
Wyoming | 121 | 121-wyoming
Yates | 123 | 123-yates
