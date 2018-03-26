all: out/render.png

clean:
	rm -rf out

# To build and publish rendered map, collected data, and Github status,
# create docker/env.ini from template in docker/env.ini-sample.
status:
	docker build -t nvkelso/elections-geodata docker
	docker run --env-file docker/env.ini --rm -v `pwd`:/vol -w /vol nvkelso/elections-geodata

.PHONY: all clean status

out/render.png: render/precincts-2163.shp render/style.xml
	render/draw.py out/conus.png out/alaska.png out/hawaii.png $@
	convert -size 1780x1250 xc:skyblue \
		out/conus.png -geometry +0+0 -composite \
		out/alaska.png -geometry +0+770 -composite \
		out/hawaii.png -geometry +580+960 -composite \
		$@

render/precincts-2163.shp: out/nation.gpkg
	rm -f $@
	ogr2ogr -t_srs EPSG:2163 -overwrite -skipfailures $@ $<

out/nation.gpkg: \
        out/01-alabama/state.gpkg \
        out/02-alaska/state.gpkg \
        out/05-arkansas/state.gpkg \
        out/04-arizona/state.gpkg \
        out/06-california/state.gpkg \
        out/08-colorado/state.gpkg \
        out/09-connecticut/state.gpkg \
        out/10-delaware/state.gpkg \
        out/11-district-of-columbia/state.gpkg \
        out/12-florida/state.gpkg \
        out/13-georgia/state.gpkg \
        out/15-hawaii/state.gpkg \
        out/16-idaho/state.gpkg \
        out/17-illinois/state.gpkg \
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
        out/40-oklahoma/state.gpkg \
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
	ogr2ogr -f GPKG -nln nation -nlt MultiPolygon -overwrite $@ out/01-alabama/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/02-alaska/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/04-arizona/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/05-arkansas/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/06-california/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/08-colorado/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/09-connecticut/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/10-delaware/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/11-district-of-columbia/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/12-florida/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/13-georgia/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/15-hawaii/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/16-idaho/state.gpkg
	ogr2ogr -f GPKG -nln nation -append $@ out/17-illinois/state.gpkg
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
	ogr2ogr -f GPKG -nln nation -append $@ out/40-oklahoma/state.gpkg
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

out/01-alabama/state.gpkg: data/01-alabama/statewide/2010/tl_2012_01_vtd10.zip
	mkdir -p out/01-alabama/source
	unzip -d out/01-alabama/source data/01-alabama/statewide/2010/tl_2012_01_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_01_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/01-alabama/source/tl_2012_01_vtd10.shp'
	rm -rf 'out/01-alabama/source'

out/02-alaska/state.gpkg: data/02-alaska/statewide/2012/SW_Amended_Precinct_shape_files.zip
	mkdir -p out/02-alaska/source
	unzip -d out/02-alaska/source data/02-alaska/statewide/2012/SW_Amended_Precinct_shape_files.zip
	# GPKG are weird
	rm -f $@
	ogr2ogr -sql "SELECT '2012' AS year, '02' AS state, DISTRICT_N AS county, CONCAT('02', DISTRICT) AS precinct, 'polygon' AS accuracy FROM SW_Amended_Precinct_shape_files" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/02-alaska/source/SW_Amended_Precinct_shape_files.shp'
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

out/06-california/state.gpkg: data/06-california/statewide/2016/merged.zip
	mkdir -p out/06-california/source
	unzip -d out/06-california/source data/06-california/statewide/2016/merged.zip
	ogr2ogr -sql "SELECT '2016' AS year, '06' AS state, '' AS county, CONCAT('06', pct16) AS precinct, 'polygon' AS accuracy FROM merged" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -overwrite -f GPKG $@ -nln state 'out/06-california/source/merged.shp'
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

out/10-delaware/state.gpkg: data/10-delaware/statewide/2012/Delaware_Election_Boundaries.zip
	mkdir -p out/10-delaware/source
	unzip -d out/10-delaware/source data/10-delaware/statewide/2012/Delaware_Election_Boundaries.zip
	rm -f $@
	ogr2ogr -sql "SELECT '2012' AS year, '10' AS state, '' AS county, CONCAT( '10', '-00-', EDRD_2012) AS precinct, 'polygon' AS accuracy FROM Election_Boundaries" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/10-delaware/source/Election_Boundaries.shp'
	rm -rf 'out/10-delaware/source'

out/11-district-of-columbia/state.gpkg: data/11-district-of-columbia/statewide/2012/Voting_Precinct__2012.zip
	mkdir -p out/11-district-of-columbia/source
	unzip -d out/11-district-of-columbia/source data/11-district-of-columbia/statewide/2012/Voting_Precinct__2012.zip
	# GPKG are weird
	rm -f $@
	ogr2ogr -sql "SELECT '2012' AS year, '11' AS state, '01' AS county, CONCAT( '11', '01', NAME) AS precinct, 'polygon' AS accuracy FROM Voting_Precinct__2012" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/11-district-of-columbia/source/Voting_Precinct__2012.shp'
	rm -rf 'out/11-district-of-columbia/source'

out/12-florida/state.gpkg: data/12-florida/statewide/2010/tl_2012_12_vtd10.zip
	mkdir -p out/12-florida/source
	unzip -d out/12-florida/source data/12-florida/statewide/2010/tl_2012_12_vtd10.zip
	# GPKG are weird
	rm -f $@
	# Skip many counties since they'll come from other files
	# Broward (portion) 011 at precinct 120110187, Palm Beach 099, Monroe 087, Gladers 043, Manatee 081, Marion 083,
	# Columbia 023, Hamilton 047, Madison 079, Taylor 123, Gadisden 039,
	# Jackson 063, Holmes 059, Bacombia 033, Martin 085
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_12_vtd10 WHERE (GEOID10 IN ('120110187') OR COUNTYFP10 IN ('099', '087', '047', '081', '083', '085', '023', '043', '079', '123', '039', '063', '059', '033'))" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG -nln state $@ 'out/12-florida/source/tl_2012_12_vtd10.shp'
	# Add newer Florida counties to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '001' AS county, CONCAT('12001', Precinct) AS precinct, 'polygon' AS accuracy FROM ALA20121106v6_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/ALA/ALA20121106v6_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '003' AS county, CONCAT('12003', Precinct) AS precinct, 'polygon' AS accuracy FROM BAK20121106v6_PctMap" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/BAK/BAK20121106v6_PctMap.shp
#
# Should be dissolved on PCT
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '005' AS county, CONCAT('12005', CAST(PCT AS character(3))) AS precinct, 'polygon' AS accuracy FROM CensusPrecinct_region" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f "ESRI Shapefile" \
		out/12-florida/source/BAY_CensusPrecinct_region.shp data/12-florida/county/2016/BAY/CensusPrecinct_region.shp
	ogr2ogr -sql "SELECT year, state, county, precinct, accuracy FROM BAY_CensusPrecinct_region" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ out/12-florida/source/BAY_CensusPrecinct_region.shp
# 	ogr2ogr -dialect sqlite -sql "SELECT ST_Union(Geometry), year, state, county, precinct, accuracy GROUP BY precinct" \
# 		-s_srs EPSG:4326 -t_srs EPSG:4326 -f "ESRI Shapefile"
# 		out/12-florida/source/BAY_CensusPrecinct_region_diss.shp out/12-florida/source/BAY_CensusPrecinct_region.shp
#
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '007' AS county, CONCAT('12007', Precinct) AS precinct, 'polygon' AS accuracy FROM BRA20121106v5_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/BRA/BRA20121106v5_PctMap.shp
	ogr2ogr -sql "SELECT '2016' AS year, '12' AS state, '009' AS county, CONCAT('12009', PCT) AS precinct, 'polygon' AS accuracy FROM Precincts_2016" \
		-s_srs '+proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.9999411764705882 +x_0=199999.9999999999 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/BRE/Precincts_2016.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '011' AS county, CONCAT('12011', PRECINCT) AS precinct, 'polygon' AS accuracy FROM PRECINCTS_region" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/BRO/PRECINCTS_region.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '013' AS county, CONCAT('12013', Precinct) AS precinct, 'polygon' AS accuracy FROM CAL20121106v5_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/CAL/CAL20121106v5_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '015' AS county, CONCAT('12015', Precinct) AS precinct, 'polygon' AS accuracy FROM CHA20121106v5_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/CHA/CHA20121106v5_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '017' AS county, CONCAT('12017', Precinct) AS precinct, 'polygon' AS accuracy FROM CIT20121106v6_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/CIT/CIT20121106v6_PctMap.shp
	ogr2ogr -sql "SELECT '2016' AS year, '12' AS state, '019' AS county, CONCAT('12019', PRECINCT) AS precinct, 'polygon' AS accuracy FROM CLA20160503_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/CLA/CLA20160503_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '021' AS county, CONCAT('12021', PRECINCT) AS precinct, 'polygon' AS accuracy FROM CLL20121106v6_PctMap_region" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/CLL/CLL20121106v6_PctMap_region.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '086' AS county, CONCAT('12086', CAST(PRECINCT AS character(3))) AS precinct, 'polygon' AS accuracy FROM DAD20120530PctMap" \
		-s_srs '+proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.9999411764705882 +x_0=199999.9999999999 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/DAD/DAD20120530PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '027' AS county, CONCAT('12027', Precinct) AS precinct, 'polygon' AS accuracy FROM DES20120630_PctMap" \
		-s_srs '+proj=tmerc +lat_0=24.33333333333333 +lon_0=-82 +k=0.9999411764705882 +x_0=199999.9999999999 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/DES/DES20120630_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '029' AS county, CONCAT('12029', Precinct) AS precinct, 'polygon' AS accuracy FROM DIX20121106v6_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/DIX/DIX20121106v6_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '031' AS county, CONCAT('12031', PRECINCT) AS precinct, 'polygon' AS accuracy FROM DUV20120615_PctMap_region" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/DUV/DUV20120615_PctMap_region.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '035' AS county, CONCAT('12035', Precinct) AS precinct, 'polygon' AS accuracy FROM FLA20121106v6_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/FLA/FLA20121106v6_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '045' AS county, CONCAT('12045', Precinct) AS precinct, 'polygon' AS accuracy FROM GUL20121106v5_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/GUL/GUL20121106v5_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '049' AS county, CONCAT('12049', Precinct) AS precinct, 'polygon' AS accuracy FROM HAR20121106v6_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/HAR/HAR20121106v6_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '051' AS county, CONCAT('12051', Precinct) AS precinct, 'polygon' AS accuracy FROM HEN20121106v5_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/HEN/HEN20121106v5_PctMap.shp
	ogr2ogr -sql "SELECT '2015' AS year, '12' AS state, '053' AS county, CONCAT('12053', CAST(Precinct AS character(3))) AS precinct, 'polygon' AS accuracy FROM HER20120615_PctMap1" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/HER/HER20120615_PctMap1.shp
	ogr2ogr -sql "SELECT '2016' AS year, '12' AS state, '055' AS county, CONCAT('12055', CombndPCT) AS precinct, 'polygon' AS accuracy FROM HIG20160801_PctMap3" \
		-s_srs '+proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.9999411764705882 +x_0=199999.9999999999 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/HIG/HIG20160801_PctMap3.shp
#
# NEEDS DISSOLVE on PRECINCT
	ogr2ogr -sql "SELECT '2015' AS year, '12' AS state, '057' AS county, CONCAT('12057', PRECINCT) AS precinct, 'polygon' AS accuracy FROM "'"20151222_PctMap_Proposed_region"' \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/HIL/20151222_PctMap_Proposed_region.shp
#
	ogr2ogr -sql "SELECT '2015' AS year, '12' AS state, '061' AS county, CONCAT('12061', PRECINCT) AS precinct, 'polygon' AS accuracy FROM IND20150210_PctMap_region" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/IND/IND20150210_PctMap_region.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '067' AS county, CONCAT('12067', Precinct) AS precinct, 'polygon' AS accuracy FROM LAF20121106v5_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/LAF/LAF20121106v5_PctMap.shp
	ogr2ogr -sql "SELECT '2016' AS year, '12' AS state, '069' AS county, CONCAT('12069', CAST(Precinct AS character(3))) AS precinct, 'polygon' AS accuracy FROM LAK20160420PctMap" \
		-s_srs '+proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.9999411764705882 +x_0=199999.9999999999 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/LAK/LAK20160420PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '071' AS county, CONCAT('12071', CAST(NAME AS character(3))) AS precinct, 'polygon' AS accuracy FROM LEE_PCT_2012_region" \
		-s_srs EPSG:4019 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/LEE/LEE_PCT_2012_region.shp
	ogr2ogr -sql "SELECT '2016' AS year, '12' AS state, '073' AS county, CONCAT('12073', PRECINCT) AS precinct, 'polygon' AS accuracy FROM LEO02160608_PctMap" \
		-s_srs '+proj=lcc +lat_1=29.58333333333333 +lat_2=30.75 +lat_0=29 +lon_0=-84.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/LEO/LEO02160608_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '075' AS county, CONCAT('12075', Precinct) AS precinct, 'polygon' AS accuracy FROM LEV20121106v5_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/LEV/LEV20121106v5_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '089' AS county, CONCAT('12089', Precinct) AS precinct, 'polygon' AS accuracy FROM NAS20121106v5_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/NAS/NAS20121106v5_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '091' AS county, CONCAT('12091', Precinct) AS precinct, 'polygon' AS accuracy FROM OKA20121106v5_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/OKA/OKA20121106v5_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '093' AS county, CONCAT('12093', DISTRICT) AS precinct, 'polygon' AS accuracy FROM "'"2012 Precincts"' \
		-s_srs '+proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.9999411764705882 +x_0=199999.9999999446 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/OKE/2012\ Precincts.shp
	ogr2ogr -sql "SELECT '2016' AS year, '12' AS state, '095' AS county, CONCAT('12095', PrecMay201) AS precinct, 'polygon' AS accuracy FROM ORA20160506_PctMap_region" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/ORA/ORA20160506_PctMap_region.shp
	ogr2ogr -sql "SELECT '2016' AS year, '12' AS state, '097' AS county, CONCAT('12097', PCT2014) AS precinct, 'polygon' AS accuracy FROM "'"2016_06 Osceola Precincts"' \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/OSC/2016_06\ Osceola\ Precincts.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '101' AS county, CONCAT('12101', Precinct) AS precinct, 'polygon' AS accuracy FROM PAS20121106v5_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/PAS/PAS20121106v5_PctMap.shp
	ogr2ogr -sql "SELECT '2016' AS year, '12' AS state, '103' AS county, CONCAT('12103', PRECINCT) AS precinct, 'polygon' AS accuracy FROM PIN20160503PCTSHAPE" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/PIN/PIN20160503PCTSHAPE.shp
	ogr2ogr -sql "SELECT '2016' AS year, '12' AS state, '105' AS county, CONCAT('12105', DISTRICT) AS precinct, 'polygon' AS accuracy FROM "'"2016 Polk Precincts"' \
		-s_srs '+proj=tmerc +lat_0=24.33333333333333 +lon_0=-82 +k=0.9999411764705882 +x_0=199999.9999999446 +y_0=0 +ellps=GRS80 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/POL/2016\ Polk\ Precincts.shp
	ogr2ogr -sql "SELECT '2016' AS year, '12' AS state, '107' AS county, CONCAT('12107', Prect_txt) AS precinct, 'polygon' AS accuracy FROM PUT20160614PctMap" \
		-s_srs '+proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.9999411764705882 +x_0=199999.9999999999 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/PUT/PUT20160614PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '113' AS county, CONCAT('12113', Precinct) AS precinct, 'polygon' AS accuracy FROM SAN20121106v5_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/SAN/SAN20121106v5_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '115' AS county, CONCAT('12115', PRECINCT) AS precinct, 'polygon' AS accuracy FROM Sarasota_Pcts_2012_region" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/SAR/Sarasota_Pcts_2012_region.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '117' AS county, CONCAT('12117', Precinct) AS precinct, 'polygon' AS accuracy FROM SEM20121106v6_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/SEM/SEM20121106v6_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '109' AS county, CONCAT('12109', Precinct) AS precinct, 'polygon' AS accuracy FROM STJ20121106v6_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/STJ/STJ20121106v6_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '111' AS county, CONCAT('12111', Precinct) AS precinct, 'polygon' AS accuracy FROM STL20121106v6_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/STL/STL20121106v6_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '119' AS county, CONCAT('12119', Precinct) AS precinct, 'polygon' AS accuracy FROM SUM20121106v6_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/SUM/SUM20121106v6_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '121' AS county, CONCAT('12121', Precinct) AS precinct, 'polygon' AS accuracy FROM SUW20121106v5_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/SUW/SUW20121106v5_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '125' AS county, CONCAT('12125', Precinct) AS precinct, 'polygon' AS accuracy FROM UNI20121106v5_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/UNI/UNI20121106v5_PctMap.shp
	ogr2ogr -sql "SELECT '2016' AS year, '12' AS state, '127' AS county, CONCAT('12127', PRECINCT) AS precinct, 'polygon' AS accuracy FROM VOL20160721_PctMap" \
		-s_srs '+proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.9999411764705882 +x_0=199999.9999999999 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/VOL/VOL20160721_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '129' AS county, CONCAT('12129', PRECINCT) AS precinct, 'polygon' AS accuracy FROM WAK20121106v5_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/WAK/WAK20121106v5_PctMap.shp
	ogr2ogr -sql "SELECT '2012' AS year, '12' AS state, '131' AS county, CONCAT('12131', PRECINCT) AS precinct, 'polygon' AS accuracy FROM WAL20121106v6_PctMap" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/WAL/WAL20121106v6_PctMap.shp
# start per precinct append for a county worth
	ogr2ogr -sql "SELECT '2014' AS year, '12' AS state, '065' AS county, '1206501' AS precinct, 'polygon' AS accuracy FROM precinct1" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/JEF/precinct1.shp
	ogr2ogr -sql "SELECT '2014' AS year, '12' AS state, '065' AS county, '1206510' AS precinct, 'polygon' AS accuracy FROM precinct10" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/JEF/precinct10.shp
	ogr2ogr -sql "SELECT '2014' AS year, '12' AS state, '065' AS county, '1206511' AS precinct, 'polygon' AS accuracy FROM precinct11" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/JEF/precinct11.shp
	ogr2ogr -sql "SELECT '2014' AS year, '12' AS state, '065' AS county, '1206512' AS precinct, 'polygon' AS accuracy FROM precinct12" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/JEF/precinct12.shp
	ogr2ogr -sql "SELECT '2014' AS year, '12' AS state, '065' AS county, '1206513' AS precinct, 'polygon' AS accuracy FROM precinct13" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/JEF/precinct13.shp
	ogr2ogr -sql "SELECT '2014' AS year, '12' AS state, '065' AS county, '1206514' AS precinct, 'polygon' AS accuracy FROM precinct14" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/JEF/precinct14.shp
	ogr2ogr -sql "SELECT '2014' AS year, '12' AS state, '065' AS county, '1206515' AS precinct, 'polygon' AS accuracy FROM precinct15" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/JEF/precinct15.shp
	ogr2ogr -sql "SELECT '2014' AS year, '12' AS state, '065' AS county, '1206502' AS precinct, 'polygon' AS accuracy FROM precinct2" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/JEF/precinct2.shp
	ogr2ogr -sql "SELECT '2014' AS year, '12' AS state, '065' AS county, '1206503' AS precinct, 'polygon' AS accuracy FROM precinct3" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/JEF/precinct3.shp
	ogr2ogr -sql "SELECT '2014' AS year, '12' AS state, '065' AS county, '1206504' AS precinct, 'polygon' AS accuracy FROM precinct4" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/JEF/precinct4.shp
	ogr2ogr -sql "SELECT '2014' AS year, '12' AS state, '065' AS county, '1206505' AS precinct, 'polygon' AS accuracy FROM precinct5" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/JEF/precinct5.shp
	ogr2ogr -sql "SELECT '2014' AS year, '12' AS state, '065' AS county, '1206506' AS precinct, 'polygon' AS accuracy FROM precinct6" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/JEF/precinct6.shp
	ogr2ogr -sql "SELECT '2014' AS year, '12' AS state, '065' AS county, '1206507' AS precinct, 'polygon' AS accuracy FROM precinct7" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/JEF/precinct7.shp
	ogr2ogr -sql "SELECT '2014' AS year, '12' AS state, '065' AS county, '1206508' AS precinct, 'polygon' AS accuracy FROM precinct8" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/JEF/precinct8.shp
	ogr2ogr -sql "SELECT '2014' AS year, '12' AS state, '065' AS county, '1206509' AS precinct, 'polygon' AS accuracy FROM precinct9" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/12-florida/county/2016/JEF/precinct9.shp
# resume normal appends
	ogr2ogr -sql "SELECT '2015' AS year, '12' AS state, '041' AS county, CONCAT('12041', Name) AS precinct, 'polygon' AS accuracy FROM FL_20121106v5_PctMap" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ "/vsizip/data/12-florida/county/2016/GIL/GIL20121106v6_PctMap7f1098a5-00b8-4103-a5c6-c32c8d5d5cdc.kmz"
	ogr2ogr -sql "SELECT '2015' AS year, '12' AS state, '077' AS county, CONCAT('12077', Name) AS precinct, 'polygon' AS accuracy FROM FL_20121106v5_PctMap" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ "/vsizip/data/12-florida/county/2016/LIB/LIB20131203v6_PctMapb98ea6f1-7d07-4f79-98de-4c89b3866bfe.kmz"
	ogr2ogr -sql "SELECT '2015' AS year, '12' AS state, '133' AS county, CONCAT('12133', Name) AS precinct, 'polygon' AS accuracy FROM FL_pctmap_20121106_v5_fix_v01" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ "/vsizip/data/12-florida/county/2016/WAS/WAS20121106v5_fix_PctMapfb343ed9-2384-4c1b-96c7-95f2e0ec57b0.kmz"
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

out/17-illinois/state.gpkg: data/17-illinois/statewide/2010/tl_2012_17_vtd10.zip
	mkdir -p out/17-illinois/source
	unzip -d out/17-illinois/source data/17-illinois/statewide/2010/tl_2012_17_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_17_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/17-illinois/source/tl_2012_17_vtd10.shp'
	rm -rf 'out/17-illinois/source'

out/18-indiana/state.gpkg: data/18-indiana/statewide/2010/tl_2012_18_vtd10.zip \
		data/18-indiana/003-allen/2012/precincts.geojson \
		data/18-indiana/039-elkhart/2012/precincts.geojson \
		data/18-indiana/057-hamilton/2012/precincts.geojson \
		data/18-indiana/097-marion/2012/precincts.geojson \
		data/18-indiana/141-St-Joseph/2012/Voter_Precincts.zip \
		data/18-indiana/157-tippecanoe/2016/precincts.geojson \
		data/18-indiana/163-vanderburgh/2012/precincts.geojson
	mkdir -p out/18-indiana/source
	unzip -d out/18-indiana/source data/18-indiana/statewide/2010/tl_2012_18_vtd10.zip
	
	# GPKG are weird
	rm -f $@

	# Skip a few since they'll come from another file.
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_18_vtd10 WHERE COUNTYFP10 NOT IN ('003', '039', '057', '097', '141', '157', '163')" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -nln state -nlt MultiPolygon -f GPKG out/18-indiana/state.gpkg out/18-indiana/source/tl_2012_18_vtd10.shp
	
	# Add Allen County (FIPS 003) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2012' AS year, '18' AS state, '003' AS county, Precinct AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		out/18-indiana/state.gpkg data/18-indiana/003-allen/2012/precincts.geojson
	
	# Add Elkhart County (FIPS 039) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2012' AS year, '18' AS state, '039' AS county, P12 AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		out/18-indiana/state.gpkg data/18-indiana/039-elkhart/2012/precincts.geojson
	
	# Add Hamilton County (FIPS 057) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2012' AS year, '18' AS state, '057' AS county, PRECINCT AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		out/18-indiana/state.gpkg data/18-indiana/057-hamilton/2012/precincts.geojson
	
	# Add Marion County (FIPS 097) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2012' AS year, '18' AS state, '097' AS county, PRECINCT AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		out/18-indiana/state.gpkg data/18-indiana/097-marion/2012/precincts.geojson
	
	# Add St. Joesph County (FIPS 141) to the statewide Geopackage file.
	mkdir -p out/18-indiana/source/141-St-Joseph
	unzip -d out/18-indiana/source/141-St-Joseph data/18-indiana/141-St-Joseph/2012/Voter_Precincts.zip
	ogr2ogr -sql "SELECT '2012' AS year, '18' AS state, '141' AS county, PRECINCT AS precinct, 'polygon' AS accuracy FROM Voter_Precincts" \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		out/18-indiana/state.gpkg out/18-indiana/source/141-St-Joseph/Voter_Precincts.shp
	
	# Add Tippecanoe County (FIPS 157) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '18' AS state, '157' AS county, P12_STFID AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		out/18-indiana/state.gpkg data/18-indiana/157-tippecanoe/2016/precincts.geojson
	
	# Add Vanderburgh County (FIPS 163) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2012' AS year, '18' AS state, '163' AS county, NAME AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		out/18-indiana/state.gpkg data/18-indiana/163-vanderburgh/2012/precincts.geojson
	
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
	unzip -d out/21-kentucky/source data/21-kentucky/statewide/2016/kyprecinctsmergedfinal_mod.zip
	rm -f $@
	ogr2ogr -sql "SELECT '2014' AS year, 'Kentucky' AS state, COUNTY AS county, VTD AS precinct, 'polygon' AS accuracy FROM kyprecinctsmergedfinal_mod" \
		-t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/21-kentucky/source/kyprecinctsmergedfinal_mod.shp'
	rm -rf out/21-kentucky/source

out/22-louisiana/state.gpkg: data/22-louisiana/statewide/2016/2016_LA_Precincts.zip
	mkdir -p out/22-louisiana/source
	unzip -d out/22-louisiana/source data/22-louisiana/statewide/2016/2016_LA_Precincts.zip
	rm -f out/22-louisiana/source/temporary.geojson
	ogr2ogr -sql "SELECT '2016' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM "'"2016_LA_Precincts"' \
		-s_srs EPSG:4019 -t_srs EPSG:4326 -overwrite -f GeoJSON out/22-louisiana/source/temporary.geojson out/22-louisiana/source/2016_LA_Precincts.shp
	# GPKG are weird
	rm -f $@
	ogr2ogr -overwrite -f GPKG $@ out/22-louisiana/source/temporary.geojson
	rm -rf 'out/22-louisiana/source'

out/23-maine/state.gpkg: data/23-maine/statewide/2010/tl_2012_23_vtd10.zip
	mkdir -p out/23-maine/source
	unzip -d out/23-maine/source data/23-maine/statewide/2010/tl_2012_23_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_23_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/23-maine/source/tl_2012_23_vtd10.shp'
	rm -rf 'out/23-maine/source'

# "2010" Census data from 2012 release is used in newer elections, see Readme
out/24-maryland/state.gpkg: data/24-maryland/statewide/2010/tl_2012_24_vtd10.zip
	mkdir -p out/24-maryland/source
	unzip -d out/24-maryland/source data/24-maryland/statewide/2010/tl_2012_24_vtd10.zip
	# GPKG are weird
	rm -f $@
	ogr2ogr -sql "SELECT '2016' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_24_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/24-maryland/source/tl_2012_24_vtd10.shp'
	rm -rf 'out/24-maryland/source'

out/25-massachusetts/state.gpkg: data/25-massachusetts/statewide/2010/tl_2012_25_vtd10.zip
	mkdir -p out/25-massachusetts/source
	unzip -d out/25-massachusetts/source data/25-massachusetts/statewide/2010/tl_2012_25_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_25_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/25-massachusetts/source/tl_2012_25_vtd10.shp'
	rm -rf 'out/25-massachusetts/source'

out/26-michigan/state.gpkg: data/26-michigan/statewide/2016/2016_Voting_Precincts.zip
	mkdir -p out/26-michigan/source
	# GPKG are weird
	rm -f $@
	unzip -d out/26-michigan/source data/26-michigan/statewide/2016/2016_Voting_Precincts.zip
	# Write to temporary GeoJSON because OGR SQL and GPKG driver
	# don't like digits at the start of the shapefile layer name.
	ogr2ogr -sql "SELECT ElectionYe AS year, '26' AS state, CountyFips AS county, CONCAT('26', VTD2016) AS precinct, 'polygon' AS accuracy FROM "'"2016_Voting_Precincts"' \
		-f GeoJSON out/26-michigan/source/temporary.geojson out/26-michigan/source/2016_Voting_Precincts.shp
	ogr2ogr -overwrite -f GPKG $@ out/26-michigan/source/temporary.geojson
	rm -rf 'out/26-michigan/source'

out/27-minnesota/state.gpkg: data/27-minnesota/statewide/2016/elec2016.zip
	mkdir -p out/27-minnesota/source
	unzip -d out/27-minnesota/source data/27-minnesota/statewide/2016/elec2016.zip
	# GPKG are weird
	rm -f $@
	ogr2ogr -sql "SELECT '2016' AS year, 'Minnesota' AS state, COUNTYFIPS AS county, VTD AS precinct, 'polygon' AS accuracy FROM elec2016" \
		-s_srs EPSG:26915 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/27-minnesota/source/elec2016.shp'
	rm -rf 'out/27-minnesota/source'

out/28-mississippi/state.gpkg: data/28-mississippi/statewide/2012/precincts_2012.zip
	mkdir -p out/28-mississippi/source
	# GPKG are weird
	rm -f $@
	unzip -d out/28-mississippi/source data/28-mississippi/statewide/2012/precincts_2012.zip
	ogr2ogr -sql "SELECT '2012' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM precincts_12" \
		-s_srs EPSG:3814 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/28-mississippi/source/precincts_12.shp'
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

out/35-new-mexico/state.gpkg: data/35-new-mexico/statewide/2012/nm-2012-precincts.zip
	mkdir -p out/35-new-mexico/source
	unzip -d out/35-new-mexico/source data/35-new-mexico/statewide/2012/nm-2012-precincts.zip
	# GPKG are weird
	rm -f $@
	ogr2ogr -sql "SELECT '2012' AS year, '35' AS state, '' AS county, CONCAT('35', NAME10) AS precinct, 'polygon' AS accuracy FROM precincts_2012" \
		-s_srs EPSG:32613 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/35-new-mexico/source/precincts_2012.shp'
	rm -rf 'out/35-new-mexico/source'

out/36-new-york/state.gpkg: data/36-new-york/statewide/2010/tl_2012_36_vtd10.zip
	mkdir -p out/36-new-york/source
	# GPKG are weird
	rm -f $@
	# Baseline Census 2010 for state (excluding cutouts)
	unzip -d out/36-new-york/source data/36-new-york/statewide/2010/tl_2012_36_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_36_vtd10 WHERE COUNTYFP10 NOT IN ('005','047','061','069','081','083','085')" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ 'out/36-new-york/source/tl_2012_36_vtd10.shp'
	# Add New York City (includes multiple counties, hmm)
	unzip -d out/36-new-york/source data/36-new-york/061-new-york/2017/nyed_17a.zip
	ogr2ogr -sql "SELECT '2017' AS year, '36' AS state, '061' AS county, CONCAT('36061', CAST(ElectDist AS character(5))) AS precinct, 'polygon' AS accuracy FROM nyed" \
		-s_srs '+proj=lcc +lat_1=40.66666666666666 +lat_2=41.03333333333333 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ 'out/36-new-york/source/nyed_17a/nyed.shp'
	# Add 069-ontario (note how cnty_ed isn't unique, so setup special source dir)
	mkdir -p out/36-new-york/source/069-ontario
	unzip -d out/36-new-york/source/069-ontario data/36-new-york/069-ontario/2016/BOE_Election_Districts_201605180903412713.zip
	ogr2ogr -sql "SELECT '2016' AS year, '36' AS state, '069' AS county, CONCAT('36069', CAST(JOINCODE AS character(10))) AS precinct, 'polygon' AS accuracy FROM BOE_Election_Districts" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ 'out/36-new-york/source/069-ontario/BOE_Election_Districts.shp'
	# Add 083-rensselaer (note how cnty_ed isn't unique, so setup special source dir)
	mkdir -p out/36-new-york/source/083-rensselaer
	unzip -d out/36-new-york/source/083-rensselaer data/36-new-york/083-rensselaer/2016/ren-cnty_ed.zip
	ogr2ogr -sql "SELECT '2016' AS year, '36' AS state, '083' AS county, CONCAT('36083', CAST(ED AS character(20))) AS precinct, 'polygon' AS accuracy FROM cnty_ed" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ 'out/36-new-york/source/083-rensselaer/cnty_ed.shp'
	rm -rf 'out/36-new-york/source'

out/37-north-carolina/state.gpkg: data/37-north-carolina/statewide/2016/SBE_PRECINCTS_20160826.zip
	mkdir -p out/37-north-carolina/source
	# GPKG are weird
	rm -f $@
	unzip -d out/37-north-carolina/source data/37-north-carolina/statewide/2016/SBE_PRECINCTS_20160826.zip
	ogr2ogr -sql "SELECT '2016' AS year, '37' AS state, COUNTY_ID AS county, CONCAT('37', CAST(COUNTY_ID as character(20)), PREC_ID) AS precinct, 'polygon' AS accuracy FROM Precincts" \
		-s_srs '+proj=lcc +lat_1=34.33333333333334 +lat_2=36.16666666666666 +lat_0=33.75 +lon_0=-79 +x_0=609601.2199999997 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -overwrite -f GPKG $@ out/37-north-carolina/source/Precincts.shp
	rm -rf 'out/37-north-carolina/source'

out/38-north-dakota/state.gpkg: data/38-north-dakota/statewide/2010/tl_2012_38_vtd10.zip data/38-north-dakota/38017-cass/2017/cassprecinct.zip
	mkdir -p out/38-north-dakota/source
	# GPKG are weird
	rm -f $@
	unzip -d out/38-north-dakota/source data/38-north-dakota/statewide/2010/tl_2012_38_vtd10.zip
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_38_vtd10 WHERE COUNTYFP10 NOT IN ('017')" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ 'out/38-north-dakota/source/tl_2012_38_vtd10.shp'
	# Add New York City (includes multiple counties, hmm)
	unzip -d out/38-north-dakota/source data/38-north-dakota/38017-cass/2017/cassprecinct.zip
	ogr2ogr -sql "SELECT '2017' AS year, '38' AS state, '017' AS county, CONCAT('38017', CAST(PRECINCT AS character(10))) AS precinct, 'polygon' AS accuracy FROM cassprecinct" \
		-s_srs '+proj=lcc +lat_1=46.18333333333333 +lat_2=47.48333333333333 +lat_0=45.66666666666666 +lon_0=-100.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ 'out/38-north-dakota/source/cassprecinct.shp'
	rm -rf 'out/38-north-dakota/source'

out/39-ohio/state.gpkg: data/39-ohio/statewide/2010/tl_2012_39_vtd10.zip \
						data/39-ohio/39003-allen/ALL_PREC.zip \
						data/39-ohio/39007-ashtabula/ATB_PREC.zip \
						data/39-ohio/39009-athens/Precincts2016.zip \
						data/39-ohio/39011-auglaize/AUG_PREC.zip \
						data/39-ohio/39013-belmont/BEL_PREC.zip \
						data/39-ohio/39015-brown/BRO_PREC.zip \
						data/39-ohio/39017-butler/BUT_PREC.zip \
						data/39-ohio/39021-champaign/CHP_PREC.zip \
						data/39-ohio/39133-portage/POR_PREC.zip \
						data/39-ohio/39157-tuscarawas/TUS_PREC.zip
	mkdir -p out/39-ohio/source
	unzip -d out/39-ohio/source data/39-ohio/statewide/2010/tl_2012_39_vtd10.zip
	rm -f $@
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, CAST(GEOID10 AS character(30)) AS precinct, 'polygon' AS accuracy FROM tl_2012_39_vtd10 WHERE COUNTYFP10 NOT IN ('003','007','009','011','013','015','017','021','133','157')" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ 'out/39-ohio/source/tl_2012_39_vtd10.shp'
	# Add multiple counties
	unzip -d out/39-ohio/source data/39-ohio/39003-allen/ALL_PREC.zip
	ogr2ogr -sql "SELECT '2016' AS year, '39' AS state, '003' AS county, CONCAT('39003', CAST(Precinct_N AS character(10))) AS precinct, 'polygon' AS accuracy FROM ALL_PREC" \
		-s_srs '+proj=lcc +lat_1=40.43333333333333 +lat_2=41.7 +lat_0=39.66666666666666 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ 'out/39-ohio/source/ALL_PREC.shp'
	unzip -d out/39-ohio/source data/39-ohio/39007-ashtabula/ATB_PREC.zip
	ogr2ogr -sql "SELECT '2016' AS year, '39' AS state, '007' AS county, CONCAT('39007', GEOID10) AS precinct, 'polygon' AS accuracy FROM ATB_PREC" \
		-s_srs '+proj=lcc +lat_1=40.43333333333333 +lat_2=41.7 +lat_0=39.66666666666666 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ 'out/39-ohio/source/ATB_PREC.shp'
	unzip -d out/39-ohio/source data/39-ohio/39009-athens/Precincts2016.zip
	ogr2ogr -sql "SELECT '2016' AS year, '39' AS state, '009' AS county, CONCAT('39009', CAST(NAME AS character(10))) AS precinct, 'polygon' AS accuracy FROM Precincts2016" \
		-s_srs '+proj=lcc +lat_1=40.43333333333333 +lat_2=41.7 +lat_0=39.66666666666666 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ 'out/39-ohio/source/Precincts2016.shp'
	unzip -d out/39-ohio/source data/39-ohio/39011-auglaize/AUG_PREC.zip
	ogr2ogr -sql "SELECT '2016' AS year, '39' AS state, '011' AS county, CONCAT('39011', CAST(PREC_NAME AS character(10))) AS precinct, 'polygon' AS accuracy FROM AUG_PREC" \
		-s_srs EPSG:4269 \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ 'out/39-ohio/source/AUG_PREC.shp'
	unzip -d out/39-ohio/source data/39-ohio/39013-belmont/BEL_PREC.zip
	ogr2ogr -sql "SELECT '2016' AS year, '39' AS state, '013' AS county, CONCAT('39013', CAST(PRECINCTNA AS character(10))) AS precinct, 'polygon' AS accuracy FROM BEL_PREC" \
		-s_srs '+proj=lcc +lat_1=38.73333333333333 +lat_2=40.03333333333333 +lat_0=38 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ 'out/39-ohio/source/BEL_PREC.shp'
	unzip -d out/39-ohio/source data/39-ohio/39015-brown/BRO_PREC.zip
	ogr2ogr -sql "SELECT '2016' AS year, '39' AS state, '015' AS county, CONCAT('39015', CAST(NAME AS character(10))) AS precinct, 'polygon' AS accuracy FROM BRO_PREC" \
		-s_srs '+proj=lcc +lat_1=40.03333333333333 +lat_2=38.73333333333333 +lat_0=38 +lon_0=-82.5 +x_0=600000.0000000016 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ 'out/39-ohio/source/BRO_PREC.shp'
	unzip -d out/39-ohio/source data/39-ohio/39017-butler/BUT_PREC.zip
	ogr2ogr -sql "SELECT '2016' AS year, '39' AS state, '017' AS county, CONCAT('39017', CAST(NEW_PREC_N AS character(10))) AS precinct, 'polygon' AS accuracy FROM BUT_PREC" \
		-s_srs '+proj=lcc +lat_1=38.73333333333333 +lat_2=40.03333333333333 +lat_0=38 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ 'out/39-ohio/source/BUT_PREC.shp'
	unzip -d out/39-ohio/source data/39-ohio/39021-champaign/CHP_PREC.zip
	ogr2ogr -sql "SELECT '2016' AS year, '39' AS state, '021' AS county, CONCAT('39021', CAST(District_N AS character(10))) AS precinct, 'polygon' AS accuracy FROM CHP_PREC" \
		-s_srs '+proj=lcc +lat_1=38.73333333333333 +lat_2=40.03333333333333 +lat_0=38 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ 'out/39-ohio/source/CHP_PREC.shp'
	unzip -d out/39-ohio/source data/39-ohio/39133-portage/POR_PREC.zip
	ogr2ogr -sql "SELECT '2016' AS year, '39' AS state, '133' AS county, CONCAT('39133', CAST(NAME_1 AS character(10))) AS precinct, 'polygon' AS accuracy FROM POR_PREC" \
		-s_srs '+proj=lcc +lat_1=40.43333333333333 +lat_2=41.7 +lat_0=39.66666666666666 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ 'out/39-ohio/source/POR_PREC.shp'
	unzip -d out/39-ohio/source data/39-ohio/39157-tuscarawas/TUS_PREC.zip
	ogr2ogr -sql "SELECT '2016' AS year, '39' AS state, '157' AS county, CONCAT('39157', CAST(PRCT_NAME AS character(30))) AS precinct, 'polygon' AS accuracy FROM TUS_PREC" \
		-s_srs '+proj=lcc +lat_1=40.43333333333333 +lat_2=41.7 +lat_0=39.66666666666666 +lon_0=-82.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ 'out/39-ohio/source/TUS_PREC.shp'
	rm -rf 'out/39-ohio/source'

out/40-oklahoma/state.gpkg: data/40-oklahoma/statewide/2016/pct_2010.zip
	mkdir -p out/40-oklahoma/source
	# GPKG are weird
	rm -f $@
	unzip -d out/40-oklahoma/source data/40-oklahoma/statewide/2016/pct_2010.zip
	ogr2ogr -sql "SELECT '2016' AS year, '40' AS state, COUNTY AS county, CONCAT('40', PCT_CEB) AS precinct, 'polygon' AS accuracy FROM pct_2010" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/40-oklahoma/source/pct_2010.shp'
	rm -rf 'out/40-oklahoma/source'

out/41-oregon/state.gpkg: data/41-oregon/metro-portland/2016/precinct.zip data/41-oregon/statewide/2012/ORprecinctsPublic-2012.zip data/41-oregon/statewide/2016/OR_2016.zip
	mkdir -p out/41-oregon/source
	unzip -d out/41-oregon/source data/41-oregon/metro-portland/2016/precinct.zip
	unzip -d out/41-oregon/source data/41-oregon/statewide/2012/ORprecinctsPublic-2012.zip
	unzip -d out/41-oregon/source data/41-oregon/statewide/2016/OR_2016.zip
	# GPKG are weird
	rm -f $@
	#
	# Census 2010 doesn't have good coverage in Oregon!?
	# Skip Portland Metro area counties (FIPS 157) since it'll come from another file.
	#ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_18_vtd10 WHERE COUNTYFP10 != '157'" \
	#	-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -nln state -nlt MultiPolygon -f GPKG out/18-indiana/state.gpkg out/18-indiana/source/tl_2012_18_vtd10.shp
	#
	# Get most counties from 2016 file
	# Except: (2016) 'Multnomah', 'Washington', 'Clackamas'
	# Except: (2012) 'Baker'
	# Except: (no-data) 'Lake', 'Lincoln', 'Tillamook', 'Union', 'Wallowa', 'Wheeler'
	ogr2ogr -sql "SELECT '2016' AS year, '41' AS state, OROnly_P_2 AS county, CONCAT('41', OROnly_Pre) AS precinct, 'polygon' AS accuracy FROM ORWA_2016 WHERE ( OROnly_P_2 NOT IN ('Multnomah', 'Washington', 'Clackamas', 'Baker', 'Lake', 'Lincoln', 'Tillamook', 'Union', 'Wallowa', 'Wheeler'))" \
		-s_srs EPSG:4326 \
		-t_srs EPSG:4326 -overwrite -f GPKG -nln state $@ 'out/41-oregon/source/ORWA_2016.shp'
	#
	# 2012: add detail in Baker county
	ogr2ogr -sql "SELECT '2012' AS year, '41' AS state, COUNTY AS county, CONCAT('41', PREC_KR, '-', PRECNAME) AS precinct, 'polygon' AS accuracy FROM ORprecinctsPublic WHERE ( COUNTY IN ('Baker'))" \
		-s_srs '+proj=lcc +lat_1=44.33333333333334 +lat_2=46 +lat_0=43.66666666666666 +lon_0=-120.5 +x_0=2500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -append -f GPKG -nln state $@ 'out/41-oregon/source/ORprecinctsPublic.shp'
	#
	# 2016: Add Portland Metro area counties (FIPS 157) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '41' AS state, COUNTY AS county, CONCAT('41', CAST(COUNTY as character(3)), CAST(PRECINCT as character(10))) AS precinct, 'polygon' AS accuracy FROM precinct" \
		-t_srs EPSG:4326 -append -f GPKG -nln state -nlt MultiPolygon \
		$@ 'out/41-oregon/source/precinct.shp'
	#-t_srs EPSG:4326 -overwrite -f GPKG -nln state -append \

	rm -rf 'out/41-oregon/source'

out/42-pennsylvania/state.gpkg: data/42-pennsylvania/statewide/2011/2011-Voting-District-Boundary-Shapefiles.zip
	mkdir -p out/42-pennsylvania
	unzip -d out/42-pennsylvania data/42-pennsylvania/statewide/2017/VTDs_Oct17.zip
	ogr2ogr -sql "SELECT '2016' AS year, 'Pennsylvania' AS state, COUNTYNAME AS county, VTD_NAME AS precinct, 'polygon' AS accuracy FROM VTDs_Oct17" \
		-t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/42-pennsylvania/VTDs_Oct17.shp'
	rm -rf 'out/42-pennsylvania/VTDs_Oct17.*'


out/45-south-carolina/state.gpkg: data/45-south-carolina/statewide/2013/sc-statewide-2013.zip
	mkdir -p out/45-south-carolina/source
	unzip -d out/45-south-carolina/source data/45-south-carolina/statewide/2013/sc-statewide-2013.zip
	# GPKG are weird
	rm -f $@
	ogr2ogr -sql "SELECT '2013' AS year, '45' AS state, COUNTY AS county, CONCAT('45', COUNTY, PCode) AS precinct, 'polygon' AS accuracy FROM Statewide" \
		-s_srs EPSG:4019 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/45-south-carolina/source/Statewide.shp'
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

out/48-texas/state.gpkg: data/48-texas/statewide/2016/Precincts.zip
	mkdir -p out/48-texas
	unzip -d out/48-texas/source data/48-texas/statewide/2016/Precincts.zip
	# GPKG are weird
	rm -f $@
	ogr2ogr -sql "SELECT '2016' AS year, '48' AS state, CNTY AS county, CONCAT('48', CAST(CNTY AS character(3)), CAST(PREC AS character(10))) AS precinct, 'polygon' AS accuracy FROM Precincts" \
		-s_srs EPSG:3081 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/48-texas/source/Precincts.shp'
	rm -rf 'out/48-texas/source'

out/49-utah/state.gpkg: data/49-utah/statewide/2016/VistaBallotAreas_shp.zip
	mkdir -p out/49-utah/source
	unzip -d out/49-utah/source data/49-utah/statewide/2016/VistaBallotAreas_shp.zip
	# GPKG are weird
	rm -f $@
	ogr2ogr -sql "SELECT '2016' AS year, '49' AS state, CountyID AS county, CONCAT('49', CAST(CountyID AS character(3)), CAST(VistaID AS character(10))) AS precinct, 'polygon' AS accuracy FROM VistaBallotAreas" \
		-s_srs EPSG:26912 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/49-utah/source/VistaBallotAreas/VistaBallotAreas.shp'
	rm -rf 'out/49-utah/source'

out/50-vermont/state.gpkg: data/50-vermont/statewide/2012/Voting_Tabulation_Areas_2012.zip
	mkdir -p out/50-vermont/source
	unzip -d out/50-vermont/source data/50-vermont/statewide/2012/Voting_Tabulation_Areas_2012.zip
	# GPKG are weird
	rm -f $@
	ogr2ogr -sql "SELECT '2016' AS year, '50' AS state, CNTY AS county, CONCAT('50', CAST(CNTY AS character(3)), CAST(NAME AS character(10))) AS precinct, 'polygon' AS accuracy FROM BoundaryOther_VOTETAB2012" \
		-s_srs '+proj=tmerc +lat_0=42.5 +lon_0=-72.5 +k=0.9999642857142857 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs' \
		-t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/50-vermont/source/BoundaryOther_VOTETAB2012.shp'
	rm -rf 'out/50-vermont/source'

out/51-virginia/state.gpkg: data/51-virginia/statewide/2016/vaprecincts2016.shp
	mkdir -p out/51-virginia
	ogr2ogr -sql "SELECT 2016 AS year, 'Virginia' AS state, locality AS county, id AS precinct, 'polygon' AS accuracy FROM vaprecincts2016" \
		-s_srs EPSG:3857 -t_srs EPSG:4326 -overwrite -f GPKG $@ $<

out/53-washington/state.gpkg: data/53-washington/statewide/2016/statewide-prec-2016-nowater.geojson.zip
	mkdir -p out/53-washington/source
	unzip -d out/53-washington/source data/53-washington/statewide/2016/statewide-prec-2016-nowater.geojson.zip
	ogr2ogr -sql "SELECT '2016' AS year, 'Washington' AS state, COUNTY AS county, ST_CODE AS precinct, 'polygon' AS accuracy FROM OGRGeoJSON" \
		-overwrite -f GPKG $@ out/53-washington/source/statewide-prec-2016-nowater.geojson
	rm -rf 'out/53-washington/source'

out/54-west-virginia/state.gpkg: data/54-west-virginia/statewide/2011/VotingDistrict_Census_201105_GCS83.zip
	mkdir -p out/54-west-virginia/source
	unzip -d out/54-west-virginia/source data/54-west-virginia/statewide/2011/VotingDistrict_Census_201105_GCS83.zip
	ogr2ogr -sql "SELECT '2011' AS year, 'West Virginia' AS state, COUNTYFP10 AS county, VTDST10 AS precinct, 'polygon' AS accuracy FROM VotingDistrict_Census_201105_GCS83" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -f GPKG $@ 'out/54-west-virginia/source/VotingDistrict_Census_201105_GCS83.shp'
	rm -rf 'out/54-west-virginia/source'

out/55-wisconsin/state.gpkg: data/55-wisconsin/statewide/2016/19902000_WI_Election_Data_with_2017_Wards.zip
	mkdir -p out/55-wisconsin/source
	unzip -d out/55-wisconsin/source data/55-wisconsin/statewide/2016/19902000_WI_Election_Data_with_2017_Wards.zip
	# GPKG allows multiple layers, and since the original poor 2016 layer was generic GeoJSON, adding the 2014 polygon resulted in 2 layers!
	rm -f $@
	ogr2ogr -sql "SELECT '2016' AS year, '55' AS state, CNTY_FIPS AS county, GEOID AS precinct, 'polygon' AS accuracy FROM '19902000_WI_Election_Data_with_2017_Wards' wi2017" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -overwrite -f GPKG $@ out/55-wisconsin/source/19902000_WI_Election_Data_with_2017_Wards.shp
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
