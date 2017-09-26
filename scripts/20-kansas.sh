#!/bin/bash -e
#
# Create a new statewide Geopackage file in $TEMPDIR/state.gpkg.
# Gunzip to a temporary GeoJSON file along the way.
# Skip Douglas County (FIPS 045) since it'll come from another file.
#
CURDIR=`dirname $0`
TEMPDIR=`$CURDIR/tmpdir.py kansas-`

ogr2ogr -sql "SELECT '2012' AS year, 'Kansas' AS state, SUBSTR(VTD_2012, 3, 3) AS county, VTD_2012 AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON WHERE SUBSTR(VTD_2012, 3, 3) != '045'" \
	-t_srs EPSG:4326 -nln state -nlt MultiPolygon -f GPKG \
	$TEMPDIR/state.gpkg data/20-kansas/statewide/2012/kansas-state-voting-precincts-2012.geojson

#
# Add Douglas County (FIPS 045) to the statewide Geopackage file.
#
ogr2ogr -sql "SELECT '2016' AS year, 'Kansas' AS state, 'Douglas' AS county, CONCAT(CAST(precinctid AS character(255)), ' ', CAST(subprecinctid AS character(255))) AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
	-t_srs EPSG:4326 -f GPKG -nln state -append \
	$TEMPDIR/state.gpkg data/20-kansas/2016/20045-douglas/precincts.geojson

#
# Add Johnson County (FIPS 091) to the statewide Geopackage file.
#
ogr2ogr -sql "SELECT '2016' AS year, 'Kansas' AS state, 'Johnson' AS county, NAME AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
        -t_srs EPSG:4326 -f GPKG -nln state -append \
        $TEMPDIR/state.gpkg data/20-kansas/2016/20091-johnson/precincts.geojson

#
# Add Sedgwick County (FIPS 173) to the statewide Geopackage file.
#
ogr2ogr -sql "SELECT '2016' AS year, 'Kansas' AS state, 'Sedgwick' as county, PRECINCT AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
        -t_srs EPSG:4326 -f GPKG -nln state -append \
        $TEMPDIR/state.gpkg data/20-kansas/2016/20173-sedgwick/precincts.geojson

#
# Add Wyandotte County (FIPS 209) to the statewide Geopackage file.
#
ogr2ogr -sql "SELECT '2016' AS year, 'Kansas' AS state, 'Wyandotte' as county, VTD_S AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
        -t_srs EPSG:4326 -f GPKG -nln state -append \
        $TEMPDIR/state.gpkg data/20-kansas/2016/20209-wyandotte/precincts.geojson

#
# Clean up temporary directory.
#
OUTFILE=`$CURDIR/tmpfile.py kansas- .gpkg`
mv $TEMPDIR/state.gpkg $OUTFILE
rm -rf $TEMPDIR
echo $OUTFILE
