#!/bin/bash -e
#
# Create a new statewide Geopackage file in $TEMPDIR/state.gpkg.
# Gunzip to a temporary SHP file along the way.
# Skip Tippecanoe County (FIPS 157) since it'll come from another file.
#
CURDIR=`dirname $0`
TEMPDIR=`$CURDIR/tmpdir.py indiana-`

mkdir -p out/18-indiana/source
unzip -d out/18-indiana/source data/18-indiana/statewide/2010/tl_2012_18_vtd10.zip
ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_18_vtd10 WHERE COUNTYFP10 != '157'" \
	-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -nln state -nlt MultiPolygon -f GPKG out/19-iowa/state.gpkg out/18-indiana/source/tl_2012_18_vtd10.shp

#
# Add Tippecanoe County (FIPS 157) to the statewide Geopackage file.
#
ogr2ogr -sql "SELECT '2016' AS year, '18' AS state, '157' AS county, P12_STFID AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
	-t_srs EPSG:4326 -f GPKG -nln state -append \
	out/18-indiana/state.gpkg data/18-indiana/157-tippecanoe/2016/precincts.geojson

#
# Clean up temporary directory.
#
OUTFILE=`$CURDIR/tmpfile.py indiana- .gpkg`
#mv $TEMPDIR/state.gpkg $OUTFILE
rm -rf $TEMPDIR
rm -rf out/18-indiana/source
echo $OUTFILE
