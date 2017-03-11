#!/bin/bash -e
#
# Create a new statewide Geopackage file in $STATE_KS.
# Gunzip to a temporary GeoJSON file along the way.
# Skip Douglas County (FIPS 045) since it'll come from another file.
#
STATE_KS=`tempfile -p KS_ -s .gpkg`
GEOJSON_KS=`tempfile -p KS_ -s .geojson`
gunzip --stdout data/20-kansas/statewide/2010/KLRD_2010VotingDistricts.geojson.gz > $GEOJSON_KS

rm $STATE_KS
ogr2ogr -sql "SELECT '2010' AS year, 'Kansas' AS state, SUBSTR(VTD_2012, 3, 3) AS county, VTD_2012 AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON WHERE SUBSTR(VTD_2012, 3, 3) != '045'" \
	-t_srs EPSG:4326 -nln state -nlt MultiPolygon -f GPKG \
	$STATE_KS $GEOJSON_KS

rm $GEOJSON_KS

#
# Add Douglas County (FIPS 045) to the statewide Geopackage file.
#
ogr2ogr -sql "SELECT '2016' AS year, 'Kansas' AS state, 'Douglas' AS county, CONCAT(CAST(precinctid AS character(255)), ' ', CAST(subprecinctid AS character(255))) AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
	-t_srs EPSG:4326 -f GPKG -nln state -append \
	$STATE_KS data/20-kansas/2016/20045-douglas/precincts.geojson

echo $STATE_KS
