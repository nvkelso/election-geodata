all: out/render.png

clean:
	rm -rf out

out/render.png: render/precincts-2163.shp
	render/draw.py $@

render/precincts-2163.shp: out/nation.gpkg
	ogr2ogr -t_srs EPSG:2163 -overwrite -skipfailures $@ $<

out/nation.gpkg: \
        out/02-alaska/state.gpkg \
        out/05-arkansas/state.gpkg \
        out/04-arizona/state.gpkg \
        out/06-california/state.gpkg \
        out/08-colorado/state.gpkg \
        out/09-connecticut/state.gpkg \
        out/11-district-of-columbia/state.gpkg \
        out/12-florida/state.gpkg \
        out/13-georgia/state.gpkg \
        out/15-hawaii/state.gpkg \
        out/16-idaho/state.gpkg \
        out/18-indiana/state.gpkg \
        out/19-iowa/state.gpkg \
        out/20-kansas/state.gpkg \
        out/21-kentucky/state.gpkg \
        out/22-louisiana/state.gpkg \
        out/23-maine/state.gpkg \
        out/24-maryland/state.gpkg \
        out/25-massachusetts/state.gpkg \
        out/26-michigan/state.gpkg \
        out/27-minnesota/state.gpkg \
        out/28-mississippi/state.gpkg \
        out/29-missouri/state.gpkg \
        out/30-montana/state.gpkg \
        out/31-nebraska/state.gpkg \
        out/32-nevada/state.gpkg \
        out/33-new-hampshire/state.gpkg \
        out/34-new-jersey/state.gpkg \
        out/35-new-mexico/state.gpkg \
        out/36-new-york/state.gpkg \
        out/37-north-carolina/state.gpkg \
        out/38-north-dakota/state.gpkg \
        out/39-ohio/state.gpkg \
        out/41-oregon/state.gpkg \
        out/42-pennsylvania/state.gpkg \
        out/45-south-carolina/state.gpkg \
        out/46-south-dakota/state.gpkg \
        out/47-tennessee/state.gpkg \
        out/48-texas/state.gpkg \
        out/49-utah/state.gpkg \
        out/50-vermont/state.gpkg \
        out/51-virginia/state.gpkg \
        out/53-washington/state.gpkg \
        out/54-west-virginia/state.gpkg \
        out/55-wisconsin/state.gpkg \
        out/56-wyoming/state.gpkg \
        out/72-puerto-rico/state.gpkg
	rm -f $@
	ogr2ogr -f GPKG -nln nation -nlt MultiPolygon -overwrite $@ out/02-alaska/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/04-arizona/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/05-arkansas/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/06-california/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/08-colorado/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/09-connecticut/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/11-district-of-columbia/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/12-florida/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/13-georgia/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/15-hawaii/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/16-idaho/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/18-indiana/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/19-iowa/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/20-kansas/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/21-kentucky/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/22-louisiana/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/23-maine/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/24-maryland/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/25-massachusetts/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/26-michigan/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/27-minnesota/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/28-mississippi/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/29-missouri/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/30-montana/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/31-nebraska/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/32-nevada/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/33-new-hampshire/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/34-new-jersey/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/35-new-mexico/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/36-new-york/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/37-north-carolina/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/38-north-dakota/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/39-ohio/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/41-oregon/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/42-pennsylvania/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/45-south-carolina/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/46-south-dakota/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/47-tennessee/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/48-texas/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/49-utah/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/50-vermont/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/51-virginia/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/53-washington/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/54-west-virginia/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/55-wisconsin/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/56-wyoming/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/72-puerto-rico/state.gpkg

out/02-alaska/state.gpkg: data/02-alaska/statewide/2010/tl_2012_02_vtd10.zip
	mkdir -p out/02-alaska/source
	unzip -d out/02-alaska/source data/02-alaska/statewide/2010/tl_2012_02_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_02_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/02-alaska/source/tl_2012_02_vtd10.shp'
	rm -rf 'out/02-alaska/source'

out/04-arizona/state.gpkg: data/04-arizona/statewide/2010/tl_2012_04_vtd10.zip
	mkdir -p out/04-arizona/source
	unzip -d out/04-arizona/source data/04-arizona/statewide/2010/tl_2012_04_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_04_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/04-arizona/source/tl_2012_04_vtd10.shp'
	rm -rf 'out/04-arizona/source'

out/05-arkansas/state.gpkg: data/05-arkansas/statewide/2016/ELECTION_PRECINCTS.zip
	mkdir -p out/05-arkansas/source
	unzip -d out/05-arkansas/source data/05-arkansas/statewide/2016/ELECTION_PRECINCTS.zip
	ogr2ogr -sql "SELECT '2016' AS year, 'Arkansas' AS state, county_fip AS county, precinct AS precinct, 'polygon' AS accuracy FROM boundaries_ELECTION_PRECINCTS" \
		-s_srs EPSG:26915 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/05-arkansas/source/boundaries_ELECTION_PRECINCTS.shp'
	rm -rf 'out/05-arkansas/source'

out/06-california/state.gpkg: data/06-california/statewide/2010/tl_2012_06_vtd10.zip
	mkdir -p out/06-california/source
	unzip -d out/06-california/source data/06-california/statewide/2010/tl_2012_06_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_06_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/06-california/source/tl_2012_06_vtd10.shp'
	rm -rf 'out/06-california/source'

out/08-colorado/state.gpkg: data/08-colorado/statewide/2010/tl_2012_08_vtd10.zip
	mkdir -p out/08-colorado/source
	unzip -d out/08-colorado/source data/08-colorado/statewide/2010/tl_2012_08_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_08_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/08-colorado/source/tl_2012_08_vtd10.shp'
	rm -rf 'out/08-colorado/source'

out/09-connecticut/state.gpkg: data/09-connecticut/statewide/2010/tl_2012_09_vtd10.zip
	mkdir -p out/09-connecticut/source
	unzip -d out/09-connecticut/source data/09-connecticut/statewide/2010/tl_2012_09_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_09_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/09-connecticut/source/tl_2012_09_vtd10.shp'
	rm -rf 'out/09-connecticut/source'

out/11-district-of-columbia/state.gpkg: data/11-district-of-columbia/statewide/2010/tl_2012_11_vtd10.zip
	mkdir -p out/11-district-of-columbia/source
	unzip -d out/11-district-of-columbia/source data/11-district-of-columbia/statewide/2010/tl_2012_11_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_11_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/11-district-of-columbia/source/tl_2012_11_vtd10.shp'
	rm -rf 'out/11-district-of-columbia/source'

out/12-florida/state.gpkg: data/12-florida/statewide/2010/tl_2012_12_vtd10.zip
	mkdir -p out/12-florida/source
	unzip -d out/12-florida/source data/12-florida/statewide/2010/tl_2012_12_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_12_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/12-florida/source/tl_2012_12_vtd10.shp'
	rm -rf 'out/12-florida/source'

out/13-georgia/state.gpkg: data/13-georgia/statewide/2016/VTD2016-Shape.shp
	mkdir -p out/13-georgia
	rm -f out/13-georgia/temporary.geojson
	ogr2ogr -sql "SELECT '2016' AS year, 'Georgia' AS state, COUNTY AS county, DISTRICT AS precinct, 'polygon' AS accuracy FROM "'"VTD2016-Shape"' \
		-s_srs EPSG:4019 -t_srs EPSG:4326 -overwrite \
		-f GeoJSON out/13-georgia/temporary.geojson $<
	ogr2ogr -overwrite -f GPKG $@ out/13-georgia/temporary.geojson
	rm out/13-georgia/temporary.geojson

out/15-hawaii/state.gpkg: data/15-hawaii/statewide/2014/Election_Precincts_Polygon.zip
	mkdir -p out/15-hawaii/source
	unzip -d out/15-hawaii/source data/15-hawaii/statewide/2014/Election_Precincts_Polygon.zip
	# GPKG are weird
	rm -f $@
	ogr2ogr -sql "SELECT '2014' AS year, 'Hawaii' AS state, county, dp AS precinct, 'polygon' AS accuracy FROM Election_Precincts" \
		-t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/15-hawaii/source/Election_Precincts.shp'
	rm -rf 'out/15-hawaii/source'

out/16-idaho/state.gpkg: data/16-idaho/statewide/2010/tl_2012_16_vtd10.zip
	mkdir -p out/16-idaho/source
	unzip -d out/16-idaho/source data/16-idaho/statewide/2010/tl_2012_16_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_16_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/16-idaho/source/tl_2012_16_vtd10.shp'
	rm -rf 'out/16-idaho/source'

out/18-indiana/state.gpkg: data/18-indiana/statewide/2010/tl_2012_18_vtd10.zip #data/18-indiana/157-tippecanoe/precincts.geojson
	mkdir -p out/18-indiana/source
	unzip -d out/18-indiana/source data/18-indiana/statewide/2010/tl_2012_18_vtd10.zip
	# Skip Tippecanoe County (FIPS 157) since it'll come from another file.
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_18_vtd10 WHERE COUNTYFP10 != '157'" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -nln state -nlt MultiPolygon -f GPKG out/18-indiana/state.gpkg out/18-indiana/source/tl_2012_18_vtd10.shp
	# Add Tippecanoe County (FIPS 157) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '18' AS state, '157' AS county, P12_STFID AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		out/18-indiana/state.gpkg data/18-indiana/157-tippecanoe/2016/precincts.geojson
	rm -rf 'out/18-indiana/source'

out/19-iowa/state.gpkg: data/19-iowa/statewide/2016/pcts_04172014_0908am.zip
	mkdir -p out/19-iowa/source
	unzip -d out/19-iowa/source data/19-iowa/statewide/2016/pcts_04172014_0908am.zip
	ogr2ogr -sql "SELECT '2016' AS year, 'Iowa' AS state, '' AS county, DISTRICT AS precinct, 'polygon' AS accuracy FROM Precincts041714" \
		-t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/19-iowa/source/pcts_04172014_0908am/Precincts041714.shp'
	rm -rf 'out/19-iowa/source'

out/20-kansas/state.gpkg: data/20-kansas/statewide/2012/kansas-state-voting-precincts-2012.geojson #data/20-kansas/2016/20045-douglas/precincts.geojson
	mkdir -p out/20-kansas
	mv `scripts/20-kansas.sh` $@

out/21-kentucky/state.gpkg: data/21-kentucky/statewide/2016/kyprecinctsmergedfinal.zip
	mkdir -p out/21-kentucky/source
	unzip -d out/21-kentucky/source data/21-kentucky/statewide/2016/kyprecinctsmergedfinal.zip
	# Write to temporary GeoJSON because OGR SQL and GPKG driver
	# don't like spaces in shapefile layer name.
	rm -f out/21-kentucky/source/temporary.geojson
	ogr2ogr -sql "SELECT '2016' AS year, 'Kentucky' AS state, COUNTY AS county, VTD AS precinct, 'polygon' AS accuracy FROM "'"KY Precincts Merged Final"' \
		-t_srs EPSG:4326 -overwrite -f GeoJSON out/21-kentucky/source/temporary.geojson 'out/21-kentucky/source/KY Precincts Merged Final.shp'
	ogr2ogr -overwrite -f GPKG $@ out/21-kentucky/source/temporary.geojson
	rm -rf out/21-kentucky/source

out/22-louisiana/state.gpkg: data/22-louisiana/statewide/2010/tl_2012_22_vtd10.zip
	mkdir -p out/22-louisiana/source
	unzip -d out/22-louisiana/source data/22-louisiana/statewide/2010/tl_2012_22_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_22_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/22-louisiana/source/tl_2012_22_vtd10.shp'
	rm -rf 'out/22-louisiana/source'

out/23-maine/state.gpkg: data/23-maine/statewide/2010/tl_2012_23_vtd10.zip
	mkdir -p out/23-maine/source
	unzip -d out/23-maine/source data/23-maine/statewide/2010/tl_2012_23_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_23_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/23-maine/source/tl_2012_23_vtd10.shp'
	rm -rf 'out/23-maine/source'

out/24-maryland/state.gpkg: data/24-maryland/statewide/2010/maryland.geojson
	mkdir -p out/24-maryland
	ogr2ogr -sql "SELECT '2010' AS year, 'Maryland' AS state, COUNTY AS county, VTD AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
		-overwrite -f GPKG $@ $<

out/25-massachusetts/state.gpkg: data/25-massachusetts/statewide/2010/tl_2012_25_vtd10.zip
	mkdir -p out/25-massachusetts/source
	unzip -d out/25-massachusetts/source data/25-massachusetts/statewide/2010/tl_2012_25_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_25_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/25-massachusetts/source/tl_2012_25_vtd10.shp'
	rm -rf 'out/25-massachusetts/source'

out/26-michigan/state.gpkg: data/26-michigan/statewide/2016/2016_Voting_Precincts.shp
	mkdir -p out/26-michigan
	# Write to temporary GeoJSON because OGR SQL and GPKG driver
	# don't like digits at the start of the shapefile layer name.
	rm -f out/26-michigan/temporary.geojson
	ogr2ogr -sql "SELECT ElectionYe AS year, 'Michigan' AS state, CountyFips AS county, VTD2016 AS precinct, 'polygon' AS accuracy FROM "'"2016_Voting_Precincts"' \
		-f GeoJSON out/26-michigan/temporary.geojson $<
	ogr2ogr -overwrite -f GPKG $@ out/26-michigan/temporary.geojson
	rm out/26-michigan/temporary.geojson

out/27-minnesota/state.gpkg: data/27-minnesota/statewide/2016/elec2016.zip
	mkdir -p out/27-minnesota/source
	unzip -d out/27-minnesota/source data/27-minnesota/statewide/2016/elec2016.zip
	# GPKG are weird
	rm -f $@
	ogr2ogr -sql "SELECT '2016' AS year, 'Minnesota' AS state, COUNTYFIPS AS county, VTD AS precinct, 'polygon' AS accuracy FROM elec2016" \
		-s_srs EPSG:26915 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/27-minnesota/source/elec2016.shp'
	rm -rf 'out/27-minnesota/source'

out/28-mississippi/state.gpkg: data/28-mississippi/statewide/2010/tl_2012_28_vtd10.zip
	mkdir -p out/28-mississippi/source
	unzip -d out/28-mississippi/source data/28-mississippi/statewide/2010/tl_2012_28_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_28_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/28-mississippi/source/tl_2012_28_vtd10.shp'
	rm -rf 'out/28-mississippi/source'

out/29-missouri/state.gpkg: data/29-missouri/statewide/2010/MO_2010_Census_Voting_Districts_shp.zip
	mkdir -p out/29-missouri/source
	unzip -d out/29-missouri/source data/29-missouri/statewide/2010/MO_2010_Census_Voting_Districts_shp.zip
	ogr2ogr -sql "SELECT '2010' AS year, 'Missouri' AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM MO_2010_Census_Voting_Districts_shp" \
		-s_srs EPSG:26915 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/29-missouri/source/MO_2010_Census_Voting_Districts_shp.shp'
	rm -rf 'out/29-missouri/source'

out/30-montana/state.gpkg: data/30-montana/statewide/2010/tl_2012_30_vtd10.zip
	mkdir -p out/30-montana/source
	unzip -d out/30-montana/source data/30-montana/statewide/2010/tl_2012_30_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_30_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/30-montana/source/tl_2012_30_vtd10.shp'
	rm -rf 'out/30-montana/source'

out/31-nebraska/state.gpkg: data/31-nebraska/statewide/2010/tl_2012_31_vtd10.zip
	mkdir -p out/31-nebraska/source
	unzip -d out/31-nebraska/source data/31-nebraska/statewide/2010/tl_2012_31_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_31_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/31-nebraska/source/tl_2012_31_vtd10.shp'
	rm -rf 'out/31-nebraska/source'

out/32-nevada/state.gpkg: data/32-nevada/statewide/2010/tl_2012_32_vtd10.zip
	mkdir -p out/32-nevada/source
	unzip -d out/32-nevada/source data/32-nevada/statewide/2010/tl_2012_32_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_32_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/32-nevada/source/tl_2012_32_vtd10.shp'
	rm -rf 'out/32-nevada/source'

out/33-new-hampshire/state.gpkg: data/33-new-hampshire/statewide/2010/tl_2012_33_vtd10.zip
	mkdir -p out/33-new-hampshire/source
	# GPKG are weird
	rm -f $@
	unzip -d out/33-new-hampshire/source data/33-new-hampshire/statewide/2010/tl_2012_33_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_33_vtd10 WHERE (FUNCSTAT10='S' AND VTDST10 NOT IN ('ZZZZZZ'))" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ 'out/33-new-hampshire/source/tl_2012_33_vtd10.shp'
	unzip -d out/33-new-hampshire/source data/33-new-hampshire/statewide/2016/nh_political_boundaries_2016.zip
	ogr2ogr -sql "SELECT '2016' AS year, '33' AS state, COUNTY AS county, CONCAT('33', CAST(FIPS AS character(3))) AS precinct, 'polygon' AS accuracy FROM nh_political_boundaries WHERE FIPS NOT IN (1035,1040,5045,7020,9110,11085,11110,13040,13060,15040,15145,17010,17050,17060,19015)" \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ 'out/33-new-hampshire/source/nh_political_boundaries.shp'
	rm -rf 'out/33-new-hampshire/source'

out/34-new-jersey/state.gpkg: data/34-new-jersey/statewide/2010/tl_2012_34_vtd10.zip
	mkdir -p out/34-new-jersey/source
	unzip -d out/34-new-jersey/source data/34-new-jersey/statewide/2010/tl_2012_34_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_34_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/34-new-jersey/source/tl_2012_34_vtd10.shp'
	rm -rf 'out/34-new-jersey/source'

out/35-new-mexico/state.gpkg: data/35-new-mexico/statewide/2010/tl_2012_35_vtd10.zip
	mkdir -p out/35-new-mexico/source
	unzip -d out/35-new-mexico/source data/35-new-mexico/statewide/2010/tl_2012_35_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_35_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/35-new-mexico/source/tl_2012_35_vtd10.shp'
	rm -rf 'out/35-new-mexico/source'

out/36-new-york/state.gpkg: data/36-new-york/statewide/2010/tl_2012_36_vtd10.zip
	mkdir -p out/36-new-york/source
	unzip -d out/36-new-york/source data/36-new-york/statewide/2010/tl_2012_36_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_36_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/36-new-york/source/tl_2012_36_vtd10.shp'
	rm -rf 'out/36-new-york/source'

out/37-north-carolina/state.gpkg: data/37-north-carolina/statewide/2016/precincts.shp
	mkdir -p out/37-north-carolina
	ogr2ogr -sql "SELECT '2016' AS year, 'North Carolina' AS state, COUNTY_NAM AS county, PREC_ID AS precinct, 'polygon' AS accuracy FROM precincts" \
		-overwrite -f GPKG $@ $<

out/38-north-dakota/state.gpkg: data/38-north-dakota/statewide/2010/tl_2012_38_vtd10.zip
	mkdir -p out/38-north-dakota/source
	unzip -d out/38-north-dakota/source data/38-north-dakota/statewide/2010/tl_2012_38_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_38_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/38-north-dakota/source/tl_2012_38_vtd10.shp'
	rm -rf 'out/38-north-dakota/source'

out/39-ohio/state.gpkg: data/39-ohio/statewide/2010/tl_2012_39_vtd10.zip
	mkdir -p out/39-ohio/source
	unzip -d out/39-ohio/source data/39-ohio/statewide/2010/tl_2012_39_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_39_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/39-ohio/source/tl_2012_39_vtd10.shp'
	rm -rf 'out/39-ohio/source'

out/41-oregon/state.gpkg: data/41-oregon/metro-portland/2016/precinct.zip
	mkdir -p out/41-oregon/source
	unzip -d out/41-oregon/source data/41-oregon/metro-portland/2016/precinct.zip
	# GPKG are weird
	rm -f $@
	#
	# Census 2010 doesn't have good coverage in Oregon!?
	# Skip Portland Metro area counties (FIPS 157) since it'll come from another file.
	#ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_18_vtd10 WHERE COUNTYFP10 != '157'" \
	#	-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -nln state -nlt MultiPolygon -f GPKG out/18-indiana/state.gpkg out/18-indiana/source/tl_2012_18_vtd10.shp
	#
	# Add Portland Metro area counties (FIPS 157) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '41' AS state, COUNTY AS county, PRECINCT AS precinct, 'polygon' AS accuracy FROM precinct" \
		-t_srs EPSG:4326 -overwrite -f GPKG -nln state -nlt MultiPolygon \
		$@ 'out/41-oregon/source/precinct.shp'
	#-t_srs EPSG:4326 -overwrite -f GPKG -nln state -append \
	rm -rf 'out/41-oregon/source'

out/18-indiana/state.gpkg: data/18-indiana/statewide/2010/tl_2012_18_vtd10.zip #data/18-indiana/157-tippecanoe/precincts.geojson
	mkdir -p out/18-indiana/source
	unzip -d out/18-indiana/source data/18-indiana/statewide/2010/tl_2012_18_vtd10.zip
	# Skip Tippecanoe County (FIPS 157) since it'll come from another file.
	# GPKG are weird
	rm -f $@
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_18_vtd10 WHERE COUNTYFP10 != '157'" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -nln state -nlt MultiPolygon -f GPKG out/18-indiana/state.gpkg out/18-indiana/source/tl_2012_18_vtd10.shp
	# Add Tippecanoe County (FIPS 157) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '18' AS state, '157' AS county, P12_STFID AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		out/18-indiana/state.gpkg data/18-indiana/157-tippecanoe/2016/precincts.geojson
	rm -rf 'out/18-indiana/source'

out/42-pennsylvania/state.gpkg: data/42-pennsylvania/statewide/2011/2011-Voting-District-Boundary-Shapefiles.zip
	mkdir -p out/42-pennsylvania
	unzip -d out/42-pennsylvania data/42-pennsylvania/statewide/2011/2011-Voting-District-Boundary-Shapefiles.zip
	ogr2ogr -sql "SELECT '2011' AS year, 'Pennsylvania' AS state, COUNTYFP11 AS county, NAMELSAD AS precinct, 'polygon' AS accuracy FROM VTDS" \
		-t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/42-pennsylvania/2011 Voting District Boundary Shapefiles/VTDS.shp'
	rm -rf 'out/42-pennsylvania/2011 Voting District Boundary Shapefiles'

out/45-south-carolina/state.gpkg: data/45-south-carolina/statewide/2010/tl_2012_45_vtd10.zip
	mkdir -p out/45-south-carolina/source
	unzip -d out/45-south-carolina/source data/45-south-carolina/statewide/2010/tl_2012_45_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_45_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/45-south-carolina/source/tl_2012_45_vtd10.shp'
	rm -rf 'out/45-south-carolina/source'

out/46-south-dakota/state.gpkg: data/46-south-dakota/statewide/2010/tl_2012_46_vtd10.zip
	mkdir -p out/46-south-dakota/source
	unzip -d out/46-south-dakota/source data/46-south-dakota/statewide/2010/tl_2012_46_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_46_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/46-south-dakota/source/tl_2012_46_vtd10.shp'
	rm -rf 'out/46-south-dakota/source'

out/47-tennessee/state.gpkg: data/47-tennessee/statewide/2010/tl_2012_47_vtd10.zip
	mkdir -p out/47-tennessee/source
	unzip -d out/47-tennessee/source data/47-tennessee/statewide/2010/tl_2012_47_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_47_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/47-tennessee/source/tl_2012_47_vtd10.shp'
	rm -rf 'out/47-tennessee/source'

out/48-texas/state.gpkg: data/48-texas/statewide/2011/Precincts.zip
	mkdir -p out/48-texas
	unzip -d out/48-texas/source data/48-texas/statewide/2011/Precincts.zip
	ogr2ogr -sql "SELECT '2011' AS year, 'Texas' AS state, CNTY AS county, PREC AS precinct, 'polygon' AS accuracy FROM Precincts" \
		-s_srs EPSG:3081 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/48-texas/source/Precincts.shp'
	rm -rf 'out/48-texas/source'

out/49-utah/state.gpkg: data/49-utah/statewide/2010/tl_2012_49_vtd10.zip
	mkdir -p out/49-utah/source
	unzip -d out/49-utah/source data/49-utah/statewide/2010/tl_2012_49_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_49_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/49-utah/source/tl_2012_49_vtd10.shp'
	rm -rf 'out/49-utah/source'

out/50-vermont/state.gpkg: data/50-vermont/statewide/2010/tl_2012_50_vtd10.zip
	mkdir -p out/50-vermont/source
	unzip -d out/50-vermont/source data/50-vermont/statewide/2010/tl_2012_50_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_50_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/50-vermont/source/tl_2012_50_vtd10.shp'
	rm -rf 'out/50-vermont/source'

out/51-virginia/state.gpkg: data/51-virginia/statewide/2016/vaprecincts2016.shp
	mkdir -p out/51-virginia
	ogr2ogr -sql "SELECT 2016 AS year, 'Virginia' AS state, locality AS county, id AS precinct, 'polygon' AS accuracy FROM vaprecincts2016" \
		-s_srs EPSG:3857 -t_srs EPSG:4326 -overwrite -f GPKG $@ $<

out/53-washington/state.gpkg: data/53-washington/statewide/2016/statewide-prec-2016-nowater.geojson
	mkdir -p out/53-washington
	ogr2ogr -sql "SELECT '2016' AS year, 'Washington' AS state, COUNTY AS county, ST_CODE AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
		-overwrite -f GPKG $@ $<

out/54-west-virginia/state.gpkg: data/54-west-virginia/statewide/2011/VotingDistrict_Census_201105_GCS83.zip
	mkdir -p out/54-west-virginia/source
	unzip -d out/54-west-virginia/source data/54-west-virginia/statewide/2011/VotingDistrict_Census_201105_GCS83.zip
	ogr2ogr -sql "SELECT '2011' AS year, 'West Virginia' AS state, COUNTYFP10 AS county, VTDST10 AS precinct, 'polygon' AS accuracy FROM VotingDistrict_Census_201105_GCS83" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/54-west-virginia/source/VotingDistrict_Census_201105_GCS83.shp'
	rm -rf 'out/54-west-virginia/source'

out/55-wisconsin/state.gpkg: data/55-wisconsin/statewide/2014/Wards_fall_2014.shape.zip
	mkdir -p out/55-wisconsin/source
	unzip -d out/55-wisconsin/source data/55-wisconsin/statewide/2014/Wards_fall_2014.shape.zip
	# GPKG allows multiple layers, and since the original poor 2016 layer was generic GeoJSON, adding the 2014 polygon resulted in 2 layers!
	rm -f $@
	ogr2ogr -sql "SELECT '2014' AS year, 'Wisconsin' AS state, CNTY_FIPS AS county, WARD_FIPS AS precinct, 'polygon' AS accuracy FROM Wards_Final_Geo_111312_2014_ED" \
		-s_srs EPSG:3070 -t_srs EPSG:4326 -overwrite -f GPKG $@ out/55-wisconsin/source/Wards_Final_Geo_111312_2014_ED.shp
	rm -rf 'out/55-wisconsin/source'

out/56-wyoming/state.gpkg: data/56-wyoming/statewide/2010/2010_wy_precincts.zip
	mkdir -p out/56-wyoming/source
	unzip -d out/56-wyoming/source data/56-wyoming/statewide/2010/2010_wy_precincts.zip
	ogr2ogr -sql "SELECT '2010' AS year, 'Wyoming' AS state, COUNTYFP10 AS county, NAMELSAD10 AS precinct, 'polygon' AS accuracy FROM WY_final" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/56-wyoming/source/WY_final.shp'
	rm -rf 'out/56-wyoming/source'

out/72-puerto-rico/state.gpkg: data/72-puerto-rico/statewide/2010/tl_2012_72_vtd10.zip
	mkdir -p out/72-puerto-rico/source
	unzip -d out/72-puerto-rico/source data/72-puerto-rico/statewide/2010/tl_2012_72_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_72_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/72-puerto-rico/source/tl_2012_72_vtd10.shp'
	rm -rf 'out/72-puerto-rico/source'
