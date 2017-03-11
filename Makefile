all: out/render.png

clean:
	rm -rf out

out/render.png: render/precincts-2163.shp
	render/draw.py $@

render/precincts-2163.shp: out/nation.gpkg
	ogr2ogr -t_srs EPSG:2163 -overwrite -skipfailures $@ $<

out/nation.gpkg: \
        out/18-indiana/state.gpkg out/20-kansas/state.gpkg \
        out/24-maryland/state.gpkg out/26-michigan/state.gpkg \
        out/37-north-carolina/state.gpkg out/42-pennsylvania/state.gpkg \
        out/53-washington/state.gpkg out/55-wisconsin/state.gpkg
	rm -f $@
	ogr2ogr -f GPKG -nln nation -nlt MultiPolygon -overwrite $@ out/18-indiana/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/20-kansas/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/24-maryland/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/26-michigan/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/37-north-carolina/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/42-pennsylvania/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/53-washington/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/55-wisconsin/state.gpkg

out/18-indiana/state.gpkg: data/18-indiana/157-tippecanoe/precincts.geojson
	mkdir -p out/18-indiana
	mkdir -p out/18-indiana/157-tippecanoe
	ogr2ogr -sql "SELECT '2016' AS year, 'Indiana' AS state, 'Tippecanoe' AS county, P12_STFID AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
		-overwrite -f GPKG out/18-indiana/157-tippecanoe/county.gpkg data/18-indiana/157-tippecanoe/precincts.geojson
	ogr2ogr -f GPKG -nln state -overwrite $@ out/18-indiana/157-tippecanoe/county.gpkg

out/20-kansas/state.gpkg: data/20-kansas/statewide/2010/KLRD_2010VotingDistricts.geojson.gz data/20-kansas/2016/20045-douglas/precincts.geojson
	mkdir -p out/20-kansas
	mv `scripts/20-kansas.sh` $@

out/24-maryland/state.gpkg: data/24-maryland/statewide/2010/maryland.geojson
	mkdir -p out/24-maryland
	ogr2ogr -sql "SELECT '2010' AS year, 'Maryland' AS state, COUNTY AS county, VTD AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
		-overwrite -f GPKG $@ $<

out/26-michigan/state.gpkg: data/26-michigan/statewide/2016/2016_Voting_Precincts.shp
	mkdir -p out/26-michigan
	# Write to temporary GeoJSON because OGR SQL and GPKG driver
	# don't like digits at the start of the shapefile layer name.
	rm -f out/26-michigan/temporary.geojson
	ogr2ogr -sql "SELECT ElectionYe AS year, 'Michigan' AS state, CountyFips AS county, VTD2016 AS precinct, 'polygon' AS accuracy FROM "'"2016_Voting_Precincts"' \
		-f GeoJSON out/26-michigan/temporary.geojson $<
	ogr2ogr -overwrite -f GPKG $@ out/26-michigan/temporary.geojson
	rm out/26-michigan/temporary.geojson

out/37-north-carolina/state.gpkg: data/37-north-carolina/statewide/2016/precincts.shp
	mkdir -p out/37-north-carolina
	ogr2ogr -sql "SELECT '2016' AS year, 'North Carolina' AS state, COUNTY_NAM AS county, PREC_ID AS precinct, 'polygon' AS accuracy FROM precincts" \
		-overwrite -f GPKG $@ $<

out/42-pennsylvania/state.gpkg: data/42-pennsylvania/statewide/2011/2011-Voting-District-Boundary-Shapefiles.zip
	mkdir -p out/42-pennsylvania
	unzip -d out/42-pennsylvania data/42-pennsylvania/statewide/2011/2011-Voting-District-Boundary-Shapefiles.zip
	ogr2ogr -sql "SELECT '2011' AS year, 'Pennsylvania' AS state, COUNTYFP11 AS county, NAMELSAD AS precinct, 'polygon' AS accuracy FROM VTDS" \
		-t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/42-pennsylvania/2011 Voting District Boundary Shapefiles/VTDS.shp'
	rm -rf 'out/42-pennsylvania/2011 Voting District Boundary Shapefiles'

out/53-washington/state.gpkg: data/53-washington/statewide-prec-2016-nowater.geojson
	mkdir -p out/53-washington
	ogr2ogr -sql "SELECT '2016' AS year, 'Washington' AS state, COUNTY AS county, ST_CODE AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
		-overwrite -f GPKG $@ $<

out/55-wisconsin/state.gpkg: data/55-wisconsin/statewide/2016/polling_place_locations_2016_nov_general_xlsx_81288_polygons.geojson
	mkdir -p out/55-wisconsin
	ogr2ogr -sql "SELECT '2016' AS year, 'Wisconsin' AS state_fips, County AS county, ReportingUnit AS precinct, accuracy FROM OGRGeoJSON" \
		-overwrite -f GPKG $@ $<
