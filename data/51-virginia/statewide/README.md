# Virginia

Doesn't have state-wide GIS precincts, so leaning on the Virginia Public Access project who have gone to each county-equivalent to aggregate a feed. Downloaded 2017-03-11.

Sources:

- https://github.com/vapublicaccessproject/va-precinct-maps-2016
- https://github.com/vapublicaccessproject/va-precinct-maps-2013

Their original README, below:

---

## Virginia Precinct Level Maps 2016

A map containing all election precincts in the state of Virginia as of June 2016

Encoding is EPSG:3857

#### Attributes

* NUMBER - Number of the precinct assigned by the locality
* FIPS - Federal Information Processing Standard (FIPS) ID for the locality. This is a combination of state + county FIPS codes.
* ID - FIPS + Precinct number
* LOCALITY - Name of the locality
* PRECINCT - Name of the precinct

---

## Virginia Precinct Level Maps 2013

A map containing all election precincts in the state of Virginia as of November 2013. This map was compiled by gathering individual map files from each locality in the state and compiling them together. Some localities did not have a digital version of their map, so VPAP had to generate these maps based on images of the locality's precinct boundaries.

The map has been run through [mapshaper](http://www.mapshaper.org/) to simplify it and reduce its size for web display purposes. It is provided in both shapefile and GeoJSON format.

#### Attributes

* FIPS - Federal Information Processing Standard (FIPS) ID for the locality. This is a combination of state + county FIPS codes.
* PRECINCT - Number of the precinct assigned by the locality
* NAME - Name of the precinct
* LOCALITY - Name of the locality

#### Acknowledgements

* Kenton Ngo - For helping to organize and integrate the map files
* Felix Schapiro - For helping to gather the maps