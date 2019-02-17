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
        data/template.shp \
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
	ogr2ogr -f GPKG -nln nation -nlt MultiPolygon -overwrite $@ data/template.shp
	ogr2ogr -f GPKG -nln nation -append $@ out/01-alabama/state.gpkg
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

out/01-alabama/state.gpkg: data/01-alabama/statewide/2010/tl_2012_01_vtd10.zip data/template.shp
	mkdir -p out/01-alabama
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_01_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/01-alabama/statewide/2010/tl_2012_01_vtd10.zip/tl_2012_01_vtd10.shp'

# from 2013 but reused for next few elections
out/02-alaska/state.gpkg: data/02-alaska/statewide/2016/ak_2016_FEST.zip data/template.shp
	mkdir -p out/02-alaska
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '02' AS state, CONCAT('0', SUBSTR(DISTRICT, 0, 2)) AS county, CONCAT('020', DISTRICT) AS precinct, name as name, 'polygon' AS accuracy FROM ak_2016" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/02-alaska/statewide/2016/ak_2016_FEST.zip/ak_2016.shp'

out/04-arizona/state.gpkg: data/04-arizona/statewide/2018/Arizona_2018_Shell.zip data/template.shp
	mkdir -p out/04-arizona
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2018' AS year, '04' AS state, CASE COUNTYNAME WHEN 'Apache' THEN '001' WHEN 'Cochise' THEN '003' WHEN 'Coconino' THEN '005' WHEN 'Gila' THEN '007' WHEN 'Graham' THEN '009' WHEN 'Greenlee' THEN '011' WHEN 'La Paz' THEN '012' WHEN 'Maricopa' THEN '013' WHEN 'Mohave' THEN '015' WHEN 'Navajo' THEN '017' WHEN 'Pima' THEN '019' WHEN 'Pinal' THEN '021' WHEN 'Santa Cruz' THEN '023' WHEN 'Yavapai' THEN '025' WHEN 'Yuma' THEN '027' ELSE COUNTYNAME END AS county, '04' || GISPRECINC AS precinct, 'polygon' AS accuracy, 'polygon' AS accuracy, GEOMETRY AS geometry FROM Arizona_2018_Shell" \
		-dialect SQLITE \
		-s_srs EPSG:2223 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/04-arizona/statewide/2018/Arizona_2018_Shell.zip/Arizona_2018_Shell.shp'

out/05-arkansas/state.gpkg: data/05-arkansas/statewide/2016/ELECTION_PRECINCTS.zip data/template.shp
	mkdir -p out/05-arkansas
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '05' AS state, county_fip AS county, precinct AS precinct, 'polygon' AS accuracy FROM boundaries_ELECTION_PRECINCTS" \
		-s_srs EPSG:26915 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/05-arkansas/statewide/2016/ELECTION_PRECINCTS.zip/boundaries_ELECTION_PRECINCTS.shp'

out/06-california/state.gpkg: data/06-california/statewide/2016/merged.zip \
	data/06-california/counties/tl_2016_06_cousub.zip \
	data/template.shp

	mkdir -p out/06-california
	# GPKG are weird
	rm -f $@

	# Because we have to join multiple data sets together, we use a staging
	# GPKG to hold them.

	# Copy precinct data
	ogr2ogr -t_srs EPSG:4326 -append -f GPKG out/06-california/staging.gpkg \
		/vsizip/data/06-california/statewide/2016/merged.zip/merged.shp

	# Copy township data. This data comes from the census.
	# https://catalog.data.gov/dataset/tiger-line-shapefile-2016-state-iowa-current-county-subdivision-state-based
	ogr2ogr -t_srs EPSG:4326 -append -f GPKG out/06-california/staging.gpkg \
		/vsizip/data/06-california/counties/tl_2016_06_cousub.zip/tl_2016_06_cousub.shp

	# Aggregate court district data into counties.
	ogr2ogr -sql "SELECT c.COUNTYFP AS county, 'polygon' AS accuracy, ST_Union(c.GEOM) AS geom, ST_Envelope(ST_Union(c.GEOM)) AS envelope FROM tl_2016_06_cousub c GROUP BY c.COUNTYFP" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln county -append -f GPKG out/06-california/staging.gpkg out/06-california/staging.gpkg

	# Pull out precincts and envelopes
	ogr2ogr -sql "SELECT pct16, area, 'polygon' AS accuracy, GEOM AS geom, ST_Envelope(GEOM) AS envelope FROM merged" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln precinct -append -f GPKG out/06-california/staging.gpkg out/06-california/staging.gpkg

	# Compute all county/precinct intersections as a precursor to assigning
	# precincts to the counties that contain the most of their area. We use
	# the funny expression as ID because the individual fields are not
	# unique.
	ogr2ogr -sql "SELECT p.pct16 || '_' || CAST(p.area AS TEXT) AS precinct, c.county AS county, 'polygon' AS accuracy, ST_Intersection(p.GEOM, c.GEOM) AS geom, ST_Area(ST_Intersection(p.GEOM, c.GEOM)) AS area, ST_Area(p.GEOM) AS parea, ST_Area(c.GEOM) AS carea FROM precinct p, county c WHERE ST_Disjoint(c.envelope, p.envelope)=0 AND ST_Intersection(p.GEOM, c.GEOM) IS NOT NULL" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln intersection -append -f GPKG out/06-california/staging.gpkg out/06-california/staging.gpkg

	# Join each precinct to the county that contains the most of its area.
	# We'd prefer to use a window function, which would make this much
	# simpler, but the build version of ogr2ogr does not have a recent
	# enough version to support them.
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '06' AS state, i.county AS county, p.pct16 AS precinct, 'polygon' AS accuracy, p.GEOM AS geometry FROM (SELECT precinct, MAX(area) AS maxarea FROM intersection i GROUP BY precinct) m, intersection i, precinct p WHERE i.precinct=m.precinct AND i.precinct=p.pct16 || '_' || CAST(p.area AS TEXT) AND i.area=m.maxarea" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ out/06-california/staging.gpkg
	
	rm -f out/06-california/staging.gpkg

out/08-colorado/state.gpkg: data/08-colorado/statewide/2010/tl_2012_08_vtd10.zip data/template.shp
	mkdir -p out/08-colorado
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2010' AS year, '08' AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_08_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/08-colorado/statewide/2010/tl_2012_08_vtd10.zip/tl_2012_08_vtd10.shp'

out/09-connecticut/state.gpkg: data/09-connecticut/statewide/2010/tl_2012_09_vtd10.zip data/template.shp
	mkdir -p out/09-connecticut
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2010' AS year, '09' AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_09_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/09-connecticut/statewide/2010/tl_2012_09_vtd10.zip/tl_2012_09_vtd10.shp'

out/10-delaware/state.gpkg: data/10-delaware/statewide/2016/de_2016_FEST.zip \
	data/10-delaware/counties/tl_2016_10_cousub.zip \
	data/template.shp

	mkdir -p out/10-delaware
	# GPKG are weird
	rm -f $@

	# Because we have to join multiple data sets together, we use a staging
	# GPKG to hold them.

	# Copy precinct data
	ogr2ogr -s_srs EPSG:4326 -t_srs EPSG:4326 -append -f GPKG out/10-delaware/staging.gpkg \
		/vsizip/data/10-delaware/statewide/2016/de_2016_FEST.zip/de_2016.shp

	# Copy township data. This data comes from the census.
	# https://catalog.data.gov/dataset/tiger-line-shapefile-2016-state-delaware-current-county-subdivision-state-based
	ogr2ogr -t_srs EPSG:4326 -append -f GPKG out/10-delaware/staging.gpkg \
		/vsizip/data/10-delaware/counties/tl_2016_10_cousub.zip/tl_2016_10_cousub.shp

	# Aggregate historical court districts data into counties.
	ogr2ogr -sql "SELECT c.COUNTYFP AS county, 'polygon' AS accuracy, ST_Union(c.GEOM) AS geom FROM tl_2016_10_cousub c GROUP BY c.COUNTYFP" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln county -append -f GPKG out/10-delaware/staging.gpkg out/10-delaware/staging.gpkg

	# Compute all county/precinct intersections as a precursor to assigning
	# precincts to the counties that contain the most of their area.
	ogr2ogr -sql "SELECT p.EDRD_2012 AS precinct, c.county AS county, 'polygon' AS accuracy, ST_Intersection(p.GEOM, c.GEOM) AS geom, ST_Area(ST_Intersection(p.GEOM, c.GEOM)) AS area, ST_Area(p.GEOM) AS parea, ST_Area(c.GEOM) AS carea FROM de_2016 p, county c WHERE ST_Disjoint(ST_Envelope(c.GEOM), ST_Envelope(p.GEOM))=0 AND ST_Intersection(p.GEOM, c.GEOM) IS NOT NULL" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln intersection -append -f GPKG out/10-delaware/staging.gpkg out/10-delaware/staging.gpkg

	# Join each precinct to the county that contains the most of its area.
	# We'd prefer to use a window function, which would make this much
	# simpler, but the build version of ogr2ogr does not have a recent
	# enough version to support them.
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '10' AS state, i.county AS county, p.EDRD_2012 AS precinct, 'polygon' AS accuracy, p.GEOM AS geometry FROM (SELECT precinct, MAX(area) AS maxarea FROM intersection i GROUP BY precinct) m, intersection i, de_2016 p WHERE i.precinct=m.precinct AND i.precinct=p.EDRD_2012 AND i.area=m.maxarea" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ out/10-delaware/staging.gpkg

	rm -rf 'out/10-delaware/staging.gpkg'

out/11-district-of-columbia/state.gpkg: data/11-district-of-columbia/statewide/2012/Voting_Precinct__2012.zip data/template.shp
	mkdir -p out/11-district-of-columbia
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2012' AS year, '11' AS state, '001' AS county, CONCAT( '11', '01', NAME) AS precinct, 'polygon' AS accuracy FROM Voting_Precinct__2012" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/11-district-of-columbia/statewide/2012/Voting_Precinct__2012.zip/Voting_Precinct__2012.shp'

out/12-florida/state.gpkg: data/12-florida/statewide/2016/fl_2016_FEST.zip data/template.shp
	mkdir -p out/12-florida
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '12' AS state, CASE county WHEN 'ALA' THEN '001' WHEN 'BAK' THEN '003' WHEN 'BAY' THEN '005' WHEN 'BRA' THEN '007' WHEN 'BRE' THEN '009' WHEN 'BRO' THEN '011' WHEN 'CAL' THEN '013' WHEN 'CHA' THEN '015' WHEN 'CIT' THEN '017' WHEN 'CLA' THEN '019' WHEN 'CLL' THEN '021' WHEN 'CLM' THEN '023' WHEN 'DAD' THEN '086' WHEN 'DES' THEN '027' WHEN 'DIX' THEN '029' WHEN 'DUV' THEN '031' WHEN 'ESC' THEN '033' WHEN 'FLA' THEN '035' WHEN 'FRA' THEN '037' WHEN 'GAD' THEN '039' WHEN 'GIL' THEN '041' WHEN 'GLA' THEN '043' WHEN 'GUL' THEN '045' WHEN 'HAM' THEN '047' WHEN 'HAR' THEN '049' WHEN 'HEN' THEN '051' WHEN 'HER' THEN '053' WHEN 'HIG' THEN '055' WHEN 'HIL' THEN '057' WHEN 'HOL' THEN '059' WHEN 'IND' THEN '061' WHEN 'JAC' THEN '063' WHEN 'JEF' THEN '065' WHEN 'LAF' THEN '067' WHEN 'LAK' THEN '069' WHEN 'LEE' THEN '071' WHEN 'LEO' THEN '073' WHEN 'LEV' THEN '075' WHEN 'LIB' THEN '077' WHEN 'MAD' THEN '079' WHEN 'MAN' THEN '081' WHEN 'MON' THEN '087' WHEN 'MRN' THEN '083' WHEN 'MRT' THEN '085' WHEN 'NAS' THEN '089' WHEN 'OKA' THEN '091' WHEN 'OKE' THEN '093' WHEN 'ORA' THEN '095' WHEN 'OSC' THEN '097' WHEN 'PAL' THEN '099' WHEN 'PAS' THEN '101' WHEN 'PIN' THEN '103' WHEN 'POL' THEN '105' WHEN 'PUT' THEN '107' WHEN 'SAN' THEN '113' WHEN 'SAR' THEN '115' WHEN 'SEM' THEN '117' WHEN 'STJ' THEN '109' WHEN 'STL' THEN '111' WHEN 'SUM' THEN '119' WHEN 'SUW' THEN '121' WHEN 'TAY' THEN '123' WHEN 'UNI' THEN '125' WHEN 'VOL' THEN '127' WHEN 'WAK' THEN '129' WHEN 'WAL' THEN '131' WHEN 'WAS' THEN '133' ELSE county END AS county, '12' || countypct AS precinct, 'polygon' AS accuracy, GEOMETRY AS geometry FROM fl_2016" \
		-dialect SQLITE \
		-s_srs '+proj=tmerc +lat_0=24.33333333333333 +lon_0=-81 +k=0.9999411764705882 +x_0=199999.9999999999 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/12-florida/statewide/2016/fl_2016_FEST.zip/fl_2016.shp'

out/13-georgia/state.gpkg: data/13-georgia/statewide/2016/VTD2016-Shape.shp data/template.shp
	mkdir -p out/13-georgia
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	rm -f out/13-georgia/temporary.geojson
	ogr2ogr -sql "SELECT '2016' AS year, '13' AS state, FIPS1 AS county, CONCAT(FIPS1, DISTRICT) AS precinct, precinct_n AS name FROM "'"VTD2016-Shape"' \
		-s_srs EPSG:4019 -t_srs EPSG:4326 -overwrite \
		-f GeoJSON out/13-georgia/temporary.geojson $<
	ogr2ogr -nln state -append $@ out/13-georgia/temporary.geojson
	rm out/13-georgia/temporary.geojson

out/15-hawaii/state.gpkg: data/15-hawaii/statewide/2014/Election_Precincts_Polygon.zip data/template.shp
	mkdir -p out/15-hawaii
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp

	# Hawaii has 5 counties:
	#
	# * Hawaii County (001)
	# * Honolulu County (003)
	# * Kalawao County (005)
	# * Kauai County (007)
	# * Maui County (009)
	#
	# The file labels "counties" as the big islands:
	# * HAWAII
	# * MAUI
	# * OAHU
	# * KAUAI
	#
	# This maps well to counties exception for Kalawao County, which is one
	# precinct in the area labeled MAUI.
	#
	# Precincts are labeled NN-NN, so we'll transform to 4-digit precinct
	# codes by removing the '-' character.
	ogr2ogr -sql "SELECT '2014' AS year, '15' AS state, CASE county WHEN 'HAWAII' THEN '001' WHEN 'MAUI' THEN (CASE dp WHEN '13-09' THEN '005' ELSE '009' END) WHEN 'OAHU' THEN '003' WHEN 'KAUAI' THEN '007' ELSE county END AS county, dp AS precinct, 'polygon' AS accuracy, geometry AS geometry FROM Election_Precincts" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln state -append -f GPKG 'out/15-hawaii/staging.gpkg' \
		'/vsizip/data/15-hawaii/statewide/2014/Election_Precincts_Polygon.zip/Election_Precincts.shp'

	ogr2ogr -sql "SELECT year AS year, state AS state, county AS county, state || county || REPLACE(precinct, '-', '') AS precinct, 'polygon' AS accuracy, geom AS geom FROM state" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ 'out/15-hawaii/staging.gpkg'

	rm -rf 'out/15-hawaii/staging.gpkg'

out/16-idaho/state.gpkg: data/16-idaho/statewide/2010/tl_2012_16_vtd10.zip data/template.shp
	mkdir -p out/16-idaho
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2010' AS year, '16' AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_16_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/16-idaho/statewide/2010/tl_2012_16_vtd10.zip/tl_2012_16_vtd10.shp'

out/17-illinois/state.gpkg: data/17-illinois/statewide/2010/tl_2012_17_vtd10.zip data/template.shp
	mkdir -p out/17-illinois
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2010' AS year, '17' AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_17_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/17-illinois/statewide/2010/tl_2012_17_vtd10.zip/tl_2012_17_vtd10.shp'

out/18-indiana/state.gpkg: data/18-indiana/statewide/2010/tl_2012_18_vtd10.zip \
		data/18-indiana/003-allen/2012/precincts.geojson.gz \
		data/18-indiana/039-elkhart/2012/precincts.geojson.gz \
		data/18-indiana/057-hamilton/2012/precincts.geojson.gz \
		data/18-indiana/097-marion/2012/precincts.geojson.gz \
		data/18-indiana/141-St-Joseph/2012/Voter_Precincts.zip \
		data/18-indiana/157-tippecanoe/2016/precincts.geojson.gz \
		data/18-indiana/163-vanderburgh/2012/precincts.geojson.gz \
		data/template.shp
	mkdir -p out/18-indiana

	# GPKG are weird
	rm -rf $@

	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp

	# Skip a few since they'll come from another file.
	ogr2ogr -sql "SELECT '2010' AS year, '18' AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_18_vtd10 WHERE COUNTYFP10 NOT IN ('003', '039', '057', '097', '141', '157', '163')" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -nln state $@ \
		'/vsizip/data/18-indiana/statewide/2010/tl_2012_18_vtd10.zip/tl_2012_18_vtd10.shp'

	# Add Allen County (FIPS 003) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2012' AS year, '18' AS state, '003' AS county, Precinct AS precinct, 'polygon' AS accuracy FROM "'"precincts.geojson"' \
		-t_srs EPSG:4326 -f GPKG -nln state -nln state -append \
		$@ /vsigzip/data/18-indiana/003-allen/2012/precincts.geojson.gz

	# Add Elkhart County (FIPS 039) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2012' AS year, '18' AS state, '039' AS county, P12 AS precinct, 'polygon' AS accuracy FROM "'"precincts.geojson"' \
		-t_srs EPSG:4326 -f GPKG -nln state -nln state -append \
		$@ /vsigzip/data/18-indiana/039-elkhart/2012/precincts.geojson.gz

	# Add Hamilton County (FIPS 057) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2012' AS year, '18' AS state, '057' AS county, PRECINCT AS precinct, 'polygon' AS accuracy FROM "'"precincts.geojson"' \
		-t_srs EPSG:4326 -f GPKG -nln state -nln state -append \
		$@ /vsigzip/data/18-indiana/057-hamilton/2012/precincts.geojson.gz

	# Add Marion County (FIPS 097) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2012' AS year, '18' AS state, '097' AS county, PRECINCT AS precinct, 'polygon' AS accuracy FROM "'"precincts.geojson"' \
		-t_srs EPSG:4326 -f GPKG -nln state -nln state -append \
		$@ /vsigzip/data/18-indiana/097-marion/2012/precincts.geojson.gz

	# Add St. Joesph County (FIPS 141) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2012' AS year, '18' AS state, '141' AS county, PRECINCT AS precinct, 'polygon' AS accuracy FROM Voter_Precincts" \
		-t_srs EPSG:4326 -f GPKG -nln state -nln state -append \
		$@ '/vsizip/data/18-indiana/141-St-Joseph/2012/Voter_Precincts.zip/Voter_Precincts.shp'

	# Add Tippecanoe County (FIPS 157) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '18' AS state, '157' AS county, P12_STFID AS precinct, 'polygon' AS accuracy FROM "'"precincts.geojson"' \
		-t_srs EPSG:4326 -f GPKG -nln state -nln state -append \
		$@ /vsigzip/data/18-indiana/157-tippecanoe/2016/precincts.geojson.gz

	# Add Vanderburgh County (FIPS 163) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2012' AS year, '18' AS state, '163' AS county, NAME AS precinct, 'polygon' AS accuracy FROM "'"precincts.geojson"' \
		-t_srs EPSG:4326 -f GPKG -nln state -nln state -append \
		$@ /vsigzip/data/18-indiana/163-vanderburgh/2012/precincts.geojson.gz

out/19-iowa/state.gpkg: data/19-iowa/statewide/2016/pcts_04172014_0908am.zip \
	data/19-iowa/counties/tl_2016_19_cousub.zip \
	data/template.shp

	mkdir -p out/19-iowa
	# GPKG are weird
	rm -f $@

	# Because we have to join multiple data sets together, we use a staging
	# GPKG to hold them.

	# Copy precinct data
	ogr2ogr -t_srs EPSG:4326 -append -f GPKG out/19-iowa/staging.gpkg \
		/vsizip/data/19-iowa/statewide/2016/pcts_04172014_0908am.zip/pcts_04172014_0908am/Precincts041714.shp

	# Copy township data. This data comes from the census.
	# https://catalog.data.gov/dataset/tiger-line-shapefile-2016-state-iowa-current-county-subdivision-state-based
	ogr2ogr -t_srs EPSG:4326 -append -f GPKG out/19-iowa/staging.gpkg \
		/vsizip/data/19-iowa/counties/tl_2016_19_cousub.zip/tl_2016_19_cousub.shp

	# Aggregate township data into counties.
	ogr2ogr -sql "SELECT c.COUNTYFP AS county, 'polygon' AS accuracy, ST_Union(c.GEOM) AS geom FROM tl_2016_19_cousub c GROUP BY c.COUNTYFP" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln county -append -f GPKG out/19-iowa/staging.gpkg out/19-iowa/staging.gpkg

	# Compute all county/precinct intersections as a precursor to assigning
	# precincts to the counties that contain the most of their area. We use
	# the funny expression as ID because the individual fields are not
	# unique.
	ogr2ogr -sql "SELECT p.DISTRICT || '_' || p.NAME AS precinct, c.county AS county, 'polygon' AS accuracy, ST_Intersection(p.GEOM, c.GEOM) AS geom, ST_Area(ST_Intersection(p.GEOM, c.GEOM)) AS area, ST_Area(p.GEOM) AS parea, ST_Area(c.GEOM) AS carea FROM Precincts041714 p, county c WHERE ST_Disjoint(ST_Envelope(c.GEOM), ST_Envelope(p.GEOM))=0 AND ST_Intersection(p.GEOM, c.GEOM) IS NOT NULL" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln intersection -append -f GPKG out/19-iowa/staging.gpkg out/19-iowa/staging.gpkg

	# Join each precinct to the county that contains the most of its area.
	# We'd prefer to use a window function, which would make this much
	# simpler, but the build version of ogr2ogr does not have a recent
	# enough version to support them.
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '19' AS state, i.county AS county, p.NAME AS precinct, 'polygon' AS accuracy, p.GEOM AS geometry FROM (SELECT precinct, MAX(area) AS maxarea FROM intersection i GROUP BY precinct) m, intersection i, Precincts041714 p WHERE i.precinct=m.precinct AND i.precinct=p.DISTRICT || '_' || p.NAME AND i.area=m.maxarea" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ out/19-iowa/staging.gpkg

	rm -rf 'out/19-iowa/staging.gpkg'

out/20-kansas/state.gpkg: data/20-kansas/statewide/2012/kansas_state_voting_precincts_2012.geojson.gz
	mkdir -p out/20-kansas
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp

	ogr2ogr -sql "SELECT '2012' AS year, '20' AS state, SUBSTR(VTD_2012, 3, 3) AS county, VTD_2012 AS precinct, 'polygon' AS accuracy FROM "'"kansas_state_voting_precincts_2012.geojson"'" WHERE SUBSTR(VTD_2012, 3, 3) NOT IN ('045', '091', '173', '209', '227')" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -nln state -nlt MultiPolygon -f GPKG \
		$@ /vsigzip/data/20-kansas/statewide/2012/kansas_state_voting_precincts_2012.geojson.gz

	# Add Douglas County (FIPS 045) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '20' AS state, '045' AS county, CONCAT(CAST(precinctid AS character(255)), ' ', CAST(subprecinctid AS character(255))) AS precinct, 'polygon' AS accuracy FROM "'"precincts.geojson"' \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ /vsigzip/data/20-kansas/2016/20045-douglas/precincts.geojson.gz

	# Add Johnson County (FIPS 091) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '20' AS state, '091' AS county, NAME AS precinct, 'polygon' AS accuracy FROM "'"precincts.geojson"' \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ /vsigzip/data/20-kansas/2016/20091-johnson/precincts.geojson.gz

	# Add Sedgwick County (FIPS 173) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '20' AS state, '173' as county, PRECINCT AS precinct, 'polygon' AS accuracy FROM "'"precincts.geojson"' \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ /vsigzip/data/20-kansas/2016/20173-sedgwick/precincts.geojson.gz

	# Add Shawnee County (FIPS 227) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '20' AS state, '227' as county, SUBSTR(PRECINCTID, 3, 6) AS precinct, 'polygon' AS accuracy FROM "'"precincts.geojson"' \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ /vsigzip/data/20-kansas/2016/20227-shawnee/precincts.geojson.gz

	# Add Wyandotte County (FIPS 209) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '20' AS state, '209' as county, VTD_S AS precinct, 'polygon' AS accuracy FROM "'"precincts.geojson"' \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ /vsigzip/data/20-kansas/2016/20209-wyandotte/precincts.geojson.gz

out/21-kentucky/state.gpkg: data/21-kentucky/statewide/2016/kyprecinctsmergedfinal.zip data/template.shp
	mkdir -p out/21-kentucky
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2014' AS year, '21' AS state, COUNTY AS county, VTD AS precinct, 'polygon' AS accuracy FROM "'"KY Precincts Merged Final"' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/21-kentucky/statewide/2016/kyprecinctsmergedfinal.zip/KY Precincts Merged Final.shp'

out/22-louisiana/state.gpkg: data/22-louisiana/statewide/2016/2016_LA_Precincts.zip data/template.shp
	mkdir -p out/22-louisiana
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM "'"2016_LA_Precincts"' \
		-s_srs EPSG:4019 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/22-louisiana/statewide/2016/2016_LA_Precincts.zip/2016_LA_Precincts.shp'

out/23-maine/state.gpkg: data/23-maine/statewide/2010/tl_2012_23_vtd10.zip data/template.shp
	mkdir -p out/23-maine
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_23_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/23-maine/statewide/2010/tl_2012_23_vtd10.zip/tl_2012_23_vtd10.shp'

# "2010" Census data from 2012 release is used in newer elections, see Readme
out/24-maryland/state.gpkg: data/24-maryland/statewide/2016/md_2016_FEST.zip data/template.shp
	mkdir -p out/24-maryland
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '24' AS state, CASE JURIS WHEN 'ALLE' THEN '001' WHEN 'ANNE' THEN '003' WHEN 'BACI' THEN '510' WHEN 'BACO' THEN '005' WHEN 'CALV' THEN '009' WHEN 'CARO' THEN '011' WHEN 'CARR' THEN '013' WHEN 'CECI' THEN '015' WHEN 'CHAR' THEN '017' WHEN 'DORC' THEN '019' WHEN 'FRED' THEN '021' WHEN 'GARR' THEN '023' WHEN 'HARF' THEN '025' WHEN 'HOWA' THEN '027' WHEN 'KENT' THEN '029' WHEN 'MONT' THEN '031' WHEN 'PRIN' THEN '033' WHEN 'QUEE' THEN '035' WHEN 'SOME' THEN '039' WHEN 'STMA' THEN '037' WHEN 'TALB' THEN '041' WHEN 'WASH' THEN '043' WHEN 'WICO' THEN '045' WHEN 'WORC' THEN '047' ELSE JURIS END AS county, '24' || preid AS precinct, name AS name, 'polygon' AS accuracy, GEOMETRY AS geometry FROM md_2016_w_ushouse" \
		-dialect SQLITE \
		-s_srs '+proj=lcc +lat_1=38.3 +lat_2=39.45 +lat_0=37.66666666666666 +lon_0=-77 +x_0=400000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/24-maryland/statewide/2016/md_2016_FEST.zip/md_2016_w_ushouse.shp'

out/25-massachusetts/state.gpkg: data/25-massachusetts/statewide/2010/tl_2012_25_vtd10.zip data/template.shp
	mkdir -p out/25-massachusetts
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_25_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/25-massachusetts/statewide/2010/tl_2012_25_vtd10.zip/tl_2012_25_vtd10.shp'

out/26-michigan/state.gpkg: data/26-michigan/statewide/2016/2016_Voting_Precincts.zip data/template.shp
	mkdir -p out/26-michigan
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '26' AS state, CONCAT('26', CountyFips) AS county, CONCAT('26', VTD2016) AS precinct FROM "'"2016_Voting_Precincts"' \
		-f GPKG $@ \
		'/vsizip/data/26-michigan/statewide/2016/2016_Voting_Precincts.zip/2016_Voting_Precincts.shp'

out/27-minnesota/state.gpkg: data/27-minnesota/statewide/2016/elec2016.zip data/template.shp
	mkdir -p out/27-minnesota
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '27' AS state, SUBSTR(VTD, 0, 5) AS county, VTD AS precinct, pctname AS name FROM elec2016" \
		-s_srs EPSG:26915 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/27-minnesota/statewide/2016/elec2016.zip/elec2016.shp'

out/28-mississippi/state.gpkg: data/28-mississippi/statewide/2012/precincts_2012.zip data/template.shp
	mkdir -p out/28-mississippi
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2012' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM precincts_12" \
		-s_srs EPSG:3814 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/28-mississippi/statewide/2012/precincts_2012.zip/precincts_12.shp'

out/29-missouri/state.gpkg: data/29-missouri/statewide/2010/MO_2010_Census_Voting_Districts_shp.zip data/template.shp
	mkdir -p out/29-missouri
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2010' AS year, '29' AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM MO_2010_Census_Voting_Districts_shp" \
		-s_srs EPSG:26915 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/29-missouri/statewide/2010/MO_2010_Census_Voting_Districts_shp.zip/MO_2010_Census_Voting_Districts_shp.shp'

out/30-montana/state.gpkg: data/30-montana/statewide/2010/tl_2012_30_vtd10.zip data/template.shp
	mkdir -p out/30-montana
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp

	# GPKG are weird
	rm -f $@

	# Skip a few since they'll come from another file.
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_30_vtd10 WHERE COUNTYFP10 NOT IN ('013', '029', '031', '047', '049', '063', '111')" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -append -f GPKG -nln state $@ \
		'/vsizip/data/30-montana/statewide/2010/tl_2012_30_vtd10.zip/tl_2012_30_vtd10.shp'

	# Add Cascade County (FIPS 013) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2018' AS year, '30' AS state, '013' AS county, CONCAT('30013', Precinct) AS precinct, 'polygon' AS accuracy FROM CascadeCntyPrecincts2013" \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/30-montana/county/2018/013-Cascade/CascadeCntyPrecincts2013.shp

	# Add Flathead County (FIPS 029) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2018' AS year, '30' AS state, '029' AS county, CONCAT('30029', Precinct) AS precinct, 'polygon' AS accuracy FROM Precinct" \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/30-montana/county/2018/029-Flathead/Precinct.shp

	# Add Gallatin County (FIPS 031) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2018' AS year, '30' AS state, '031' AS county, CONCAT('30031', Precinct) AS precinct, 'polygon' AS accuracy FROM Precincts2013" \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/30-montana/county/2018/031-Gallatin/Precincts2013.shp

	# Add Lake County (FIPS 047) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2018' AS year, '30' AS state, '047' AS county, CONCAT('30047', Precinct) AS precinct, 'polygon' AS accuracy FROM Lake_Precincts_May_2018" \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/30-montana/county/2018/047-Lake/Lake_Precincts_May_2018.shp

	# Add Lewis and Clark County (FIPS 049) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2018' AS year, '30' AS state, '049' AS county, CONCAT('30049', Precinct) AS precinct, 'polygon' AS accuracy FROM LCPrecincts" \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/30-montana/county/2018/049-LewisAndClark/LCPrecincts.shp

	# Add Missoula County (FIPS 063) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2018' AS year, '30' AS state, '063' AS county, CONCAT('30063', Precinct) AS precinct, 'polygon' AS accuracy FROM Precincts" \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/30-montana/county/2018/063-Missoula/Precincts.shp

	# Add Yellowstone County (FIPS 111) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2018' AS year, '30' AS state, '111' AS county, CONCAT('30111', Precinct) AS precinct, 'polygon' AS accuracy FROM YC_precincts" \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ data/30-montana/county/2018/111-Yellowstone/YC_precincts.shp


out/31-nebraska/state.gpkg: data/31-nebraska/statewide/2010/tl_2012_31_vtd10.zip data/template.shp
	mkdir -p out/31-nebraska
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_31_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/31-nebraska/statewide/2010/tl_2012_31_vtd10.zip/tl_2012_31_vtd10.shp'

out/32-nevada/state.gpkg: data/32-nevada/statewide/2010/tl_2012_32_vtd10.zip \
	data/template.shp \
	data/32-nevada/county/2016/clark_crel_precinct_p.zip \
	data/32-nevada/county/2016/nevadacarsoncity.zip \
	data/32-nevada/county/2016/nevadadouglas.zip \
	data/32-nevada/county/2016/nevadaelko.zip \
	data/32-nevada/county/2016/nevadaeureka.zip \
	data/32-nevada/county/2016/nevadawashoe.zip

	mkdir -p out/32-nevada
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp

	# Skip a few since they'll come from another file.
	ogr2ogr -sql "SELECT '2010' AS year, '32' AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_32_vtd10 WHERE COUNTYFP10 NOT IN ('003', '510', '005', '007', '011', '013', '031')" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/32-nevada/statewide/2010/tl_2012_32_vtd10.zip/tl_2012_32_vtd10.shp'

	# Add Clark County (FIPS 003) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '32' AS state, '003' AS county, CONCAT('32003', CAST(PREC AS character(10))) AS precinct, 'polygon' AS accuracy FROM precinct_p" \
		-s_srs '+proj=tmerc +lat_0=34.75 +lon_0=-115.5833333333333 +k=0.9999 +x_0=199999.9999999999 +y_0=7999999.999999997 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ /vsizip/data/32-nevada/county/2016/clark_crel_precinct_p.zip/precinct_p.shp

	# Add Carson City (FIPS 510) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '32' AS state, '510' AS county, CONCAT('32510', CAST(Precinct AS character(5))) AS precinct, 'polygon' AS accuracy FROM nevadacarsoncity" \
		-s_srs '+proj=tmerc +lat_0=34.75 +lon_0=-118.5833333333333 +k=0.9999 +x_0=799999.9999999998 +y_0=3999999.999999999 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ /vsizip/data/32-nevada/county/2016/nevadacarsoncity.zip/nevadacarsoncity.shp

	# Add Douglas (FIPS 005) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '32' AS state, '005' AS county, CONCAT('32005', TAG) AS precinct, 'polygon' AS accuracy FROM nevadadouglas" \
		-s_srs '+proj=tmerc +lat_0=34.75 +lon_0=-118.5833333333333 +k=0.9999 +x_0=799999.9999999998 +y_0=3999999.999999999 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ /vsizip/data/32-nevada/county/2016/nevadadouglas.zip/nevadadouglas.shp

	# Add Elko (FIPS 007) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '32' AS state, '007' AS county, CONCAT('32007', SUBSTR(NAME,10)) AS precinct, 'polygon' AS accuracy FROM nevadaelko" \
		-s_srs EPSG:26911 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ /vsizip/data/32-nevada/county/2016/nevadaelko.zip/nevadaelko.shp

	# Add Eureka (FIPS 011) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '32' AS state, '011' AS county, CONCAT('32011', Label) AS precinct, 'polygon' AS accuracy FROM nevadaeureka" \
		-s_srs EPSG:32008 -t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ /vsizip/data/32-nevada/county/2016/nevadaeureka.zip/nevadaeureka.shp

	# Add Humboldt (FIPS 013) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '32' AS state, '013' AS county, CONCAT('32013', LAYER) AS precinct, 'polygon' AS accuracy FROM nevadahumboldt" \
		-s_srs '+proj=tmerc +lat_0=34.75 +lon_0=-118.583333333333 +k=0.9999 +x_0=152400.30480061 +y_0=0 +datum=NAD27 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ /vsizip/data/32-nevada/county/2016/nevadahumboldt.zip/nevadahumboldt.shp

	# Add Washoe (FIPS 031) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '32' AS state, '031' AS county, CONCAT('32031', CAST(PRECINCT AS character(10))) AS precinct, 'polygon' AS accuracy FROM nevadawashoe" \
		-s_srs '+proj=tmerc +lat_0=34.75 +lon_0=-118.5833333333333 +k=0.9999 +x_0=800000.0000101601 +y_0=3999999.999989841 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -f GPKG -nln state -append \
		$@ /vsizip/data/32-nevada/county/2016/nevadawashoe.zip/nevadawashoe.shp


out/33-new-hampshire/state.gpkg: data/33-new-hampshire/statewide/2016/NHPolitDists.zip data/template.shp
	mkdir -p out/33-new-hampshire
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '33' AS state, CASE COUNTY WHEN 'Belknap' THEN '001' WHEN 'Carroll' THEN '003' WHEN 'Cheshire' THEN '005' WHEN 'Coos' THEN '007' WHEN 'Grafton' THEN '009' WHEN 'Hillsborough' THEN '011' WHEN 'Merrimack' THEN '013' WHEN 'Rockingham' THEN '015' WHEN 'Strafford' THEN '017' WHEN 'Sullivan' THEN '019' ELSE COUNTY END AS county, nameward AS precinct, 'polygon' AS accuracy, GEOMETRY AS geometry FROM NHPolitDists" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/33-new-hampshire/statewide/2016/NHPolitDists.zip/NHPolitDists.shp'

out/34-new-jersey/state.gpkg: data/34-new-jersey/statewide/2010/tl_2012_34_vtd10.zip data/template.shp
	mkdir -p out/34-new-jersey
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_34_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/34-new-jersey/statewide/2010/tl_2012_34_vtd10.zip/tl_2012_34_vtd10.shp'

out/35-new-mexico/state.gpkg: data/35-new-mexico/statewide/2012/nm-2012-precincts.zip \
	data/35-new-mexico/counties/tl_2016_35_cousub.zip \
	data/template.shp

	mkdir -p out/35-new-mexico
	# GPKG are weird
	rm -f $@

	# Copy precinct data
	ogr2ogr -s_srs EPSG:32613 -t_srs EPSG:4326 -append -f GPKG out/35-new-mexico/staging.gpkg \
		'/vsizip/data/35-new-mexico/statewide/2012/nm-2012-precincts.zip/precincts_2012.shp'

	# Copy township data. This data comes from the census.
	# https://catalog.data.gov/dataset/tiger-line-shapefile-2016-state-new-mexico-current-county-subdivision-state-based
	ogr2ogr -t_srs EPSG:4326 -append -f GPKG out/35-new-mexico/staging.gpkg \
		'/vsizip/data/35-new-mexico/counties/tl_2016_35_cousub.zip/tl_2016_35_cousub.shp'

	# Aggregate historical court districts data into counties.
	ogr2ogr -sql "SELECT c.COUNTYFP AS county, 'polygon' AS accuracy, ST_Union(c.GEOM) AS geom FROM tl_2016_35_cousub c GROUP BY c.COUNTYFP" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln county -append -f GPKG out/35-new-mexico/staging.gpkg out/35-new-mexico/staging.gpkg

	# Compute all county/precinct intersections as a precursor to assigning
	# precincts to the counties that contain the most of their area.
	ogr2ogr -sql "SELECT p.NAME10 AS precinct, c.county AS county, 'polygon' AS accuracy, ST_Intersection(p.GEOM, c.GEOM) AS geom, ST_Area(ST_Intersection(p.GEOM, c.GEOM)) AS area, ST_Area(p.GEOM) AS parea, ST_Area(c.GEOM) AS carea FROM precincts_2012 p, county c WHERE ST_Disjoint(ST_Envelope(c.GEOM), ST_Envelope(p.GEOM))=0 AND ST_Intersection(p.GEOM, c.GEOM) IS NOT NULL" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln intersection -append -f GPKG out/35-new-mexico/staging.gpkg out/35-new-mexico/staging.gpkg

	# Join each precinct to the county that contains the most of its area.
	# We'd prefer to use a window function, which would make this much
	# simpler, but the build version of ogr2ogr does not have a recent
	# enough version to support them.
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '10' AS state, i.county AS county, p.NAME10 AS precinct, 'polygon' AS accuracy, p.GEOM AS geometry FROM (SELECT precinct, MAX(area) AS maxarea FROM intersection i GROUP BY precinct) m, intersection i, precincts_2012 p WHERE i.precinct=m.precinct AND i.precinct=p.NAME10 AND i.area=m.maxarea" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ out/35-new-mexico/staging.gpkg

	rm -rf 'out/35-new-mexico/staging.gpkg'

out/36-new-york/state.gpkg: data/36-new-york/statewide/2010/tl_2012_36_vtd10.zip \
	data/36-new-york/001-albany/2012/2012_EDs-Albany.shp \
	data/36-new-york/003-allegany/2012/ElectionDistricts2012.shp \
	data/36-new-york/003-allegany/2014/ElectionDistricts2014.shp \
	data/36-new-york/007-broome/2016/broome_ed.shp \
	data/36-new-york/009-cattaraugus/2012/CattaraugusVotingDistricts.shp \
	data/36-new-york/011-cayuga/2012/Election_Districts.shp \
	data/36-new-york/011-cayuga/2014/Cayuga_County_NY_Elect_Dists.shp \
	data/36-new-york/019-clinton/2014/ClintonEDs.shp \
	data/36-new-york/023-cortland/2012/election_districts.shp \
	data/36-new-york/027-dutchess/2008/DutchessCountyElectionDistricts.shp \
	data/36-new-york/027-dutchess/2012/2012_EDs-Dutchess.shp \
	data/36-new-york/027-dutchess/2014/DutchessED3-6.shp \
	data/36-new-york/029-erie/2001/ny-erie-county-election_dist.zip \
	data/36-new-york/029-erie/2012/2012_EDs-Erie.shp \
	data/36-new-york/029-erie/2014/2015\ ED\ Final.shp \
	data/36-new-york/031-essex/2014/ED15.shp \
	data/36-new-york/043-herkimer/2012/2012_EDs-Herkimer.shp \
	data/36-new-york/055-monroe/2012/2012_EDs-Monroe.shp \
	data/36-new-york/059-nassau/2012/2012_EDs-Nassau.shp \
	data/36-new-york/059-nassau/2014/Nassau\ County\ Election\ Districts.shp \
	data/36-new-york/059-nassau/2018/Electin\ Districts.shp \
	data/36-new-york/061-new-york/2014/nyed.shp \
	data/36-new-york/061-new-york/2016/nyed_16d/nyed.shp \
	data/36-new-york/061-new-york/2017/nyed_17a/nyed.shp \
	data/36-new-york/063-niagara/2012/2012_EDs-Niagara.shp \
	data/36-new-york/065-oneida/2012/2012_EDs-Oneida.shp \
	data/36-new-york/067-onondaga/2012/2012_EDs-Onondaga.shp \
	data/36-new-york/067-onondaga/2014/election_districts.shp \
	data/36-new-york/069-ontario/2014/BOE_Election_Districts.shp \
	data/36-new-york/069-ontario/2016/BOE_Election_Districts_201605180903412713.zip \
	data/36-new-york/071-orange/2012/2012_EDs-Orange.shp \
	data/36-new-york/071-orange/2014/OC_ElectionDistricts2014.shp \
	data/36-new-york/073-orleans/2008/ALBIVOTE.SHP \
	data/36-new-york/073-orleans/2008/CLARVOTE.SHP \
	data/36-new-york/073-orleans/2008/MURRVOTE.SHP \
	data/36-new-york/073-orleans/2008/BARRVOTE.SHP \
	data/36-new-york/073-orleans/2008/GAINVOTE.SHP \
	data/36-new-york/073-orleans/2008/SHELVOTE.SHP \
	data/36-new-york/073-orleans/2008/CARLVOTE.SHP \
	data/36-new-york/073-orleans/2008/KENDVOTE.SHP \
	data/36-new-york/073-orleans/2008/YATEVOTE.SHP \
	data/36-new-york/075-oswego/2014/funal_run_4.shp \
	data/36-new-york/077-otsego/2012/Otsego_Voting_2012_Final.shp \
	data/36-new-york/079-putnam/2012/2012_EDs-Putnam.shp \
	data/36-new-york/083-rensselaer/2012/cnty_election_districts.shp \
	data/36-new-york/083-rensselaer/2014/cnty_ed.shp \
	data/36-new-york/083-rensselaer/2016/ren-cnty_ed.zip \
	data/36-new-york/087-rockland/2012/2012_EDs-Rockland.shp \
	data/36-new-york/087-rockland/2016/Cty_ED_Jan_15_2016.shp \
	data/36-new-york/089-st-lawrence/2012/2012_EDs-St_Lawrence.shp \
	data/36-new-york/093-schenectady/2012/2012_EDs-Duanesburg.shp \
	data/36-new-york/093-schenectady/2012/2012_EDs-Glenville.shp \
	data/36-new-york/093-schenectady/2012/2012_EDs-Niskayuna.shp \
	data/36-new-york/093-schenectady/2012/2012_EDs-Princetown.shp \
	data/36-new-york/093-schenectady/2012/2012_EDs-Rotterdam.shp \
	data/36-new-york/093-schenectady/2012/2012_EDs-Schenectady_.shp \
	data/36-new-york/095-schoharie/2012/ElectionDists.shp \
	data/36-new-york/101-steuben/2012/2012_EDs-Steuben.shp \
	data/36-new-york/101-steuben/2014/ElectionDistricts.shp \
	data/36-new-york/103-suffolk/2012/2012\ ED\ Files.shp \
	data/36-new-york/107-tioga/2012/2012_EDs-Tioga.shp \
	data/36-new-york/109-tompkins/2014/ElDistricts2014.shp \
	data/36-new-york/111-ulster/2012/2012_EDs-Ulster.shp \
	data/36-new-york/113-warren/2012/2012_EDs-Warren.shp \
	data/36-new-york/115-washington/2012/2012_EDs-Washington.shp \
	data/36-new-york/115-washington/2014/election_districts.shp \
	data/36-new-york/119-westchester/2012/2012_EDs-Westchester.shp \
	data/36-new-york/119-westchester/2014/Westchester\ 2014\ Election\ Districts.shp \
	data/36-new-york/123-yates/2012/2012_EDs-Yates.shp \
	data/template.shp
	mkdir -p out/36-new-york
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	# Baseline Census 2010 for state (excluding cutouts)
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_36_vtd10 WHERE COUNTYFP10 NOT IN ('001','003','005','007','009','011','019','023','027','029','031','043','047','055','059','061','063','065','067','069','071','073','075','077','079','081','083','085','087','089','093','095','101','103','107','109','111','113','115','119','123')" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/36-new-york/statewide/2010/tl_2012_36_vtd10.zip/tl_2012_36_vtd10.shp'

	# Add 001-albany
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '001' AS county, CONCAT('36001', CAST(DistName AS character(20))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Albany\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/001-albany/2012/2012_EDs-Albany.shp'

	# Add 003-allegany
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '003' AS county, CONCAT('36003', CAST(NAMELSAD10 AS character(20))) AS precinct, 'polygon' AS accuracy FROM ElectionDistricts2012" \
		-s_srs '+proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/003-allegany/2012/ElectionDistricts2012.shp'
	ogr2ogr -sql "SELECT '2014' AS year, '36' AS state, '003' AS county, CONCAT('36003', CAST(NAMELSAD10 AS character(20))) AS precinct, 'polygon' AS accuracy FROM ElectionDistricts2014" \
		-s_srs '+proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/003-allegany/2014/ElectionDistricts2014.shp'

	# Add 007-broome
	ogr2ogr -sql "SELECT '2016' AS year, '36' AS state, '007' AS county, CONCAT('36007', CAST(NAME AS character(20))) AS precinct, 'polygon' AS accuracy FROM broome_ed" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/007-broome/2016/broome_ed.shp'

	# Add 009-cattaraugus
	ogr2ogr -sql "SELECT '2013' AS year, '36' AS state, '009' AS county, CONCAT('36009', CAST(DISTRICT AS character(20))) AS precinct, 'polygon' AS accuracy FROM CattaraugusVotingDistricts" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-78.58333333333333 +k=0.9999375 +x_0=350000.0000000001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/009-cattaraugus/2012/CattaraugusVotingDistricts.shp'

	# Add 011-cayuga
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '011' AS county, CONCAT('36011', CAST(MUNI AS character(20)), CAST(DISTRICT AS character(20))) AS precinct, 'polygon' AS accuracy FROM Election_Districts" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/011-cayuga/2012/Election_Districts.shp'
	# This one errors with: "Failed to reproject feature 38 (geometry probably out of source or destination SRS)."
	ogr2ogr -sql "SELECT '2015' AS year, '36' AS state, '011' AS county, CONCAT('36011', CAST(MUNI AS character(20)), CAST(District AS character(20))) AS precinct, 'polygon' AS accuracy FROM Cayuga_County_NY_Elect_Dists" \
		-skipfailures -s_srs '+proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/011-cayuga/2014/Cayuga_County_NY_Elect_Dists.shp'

	# 015-chemung aren't polygons :(

	# 019-clinton
	ogr2ogr -sql "SELECT '2015' AS year, '36' AS state, '019' AS county, CONCAT('36019', CAST(Election_D AS character(20))) AS precinct, 'polygon' AS accuracy FROM ClintonEDs" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/019-clinton/2014/ClintonEDs.shp'

	# 023-cortland
	ogr2ogr -sql "SELECT '2013' AS year, '36' AS state, '023' AS county, CONCAT('36023', CAST(ED AS character(20))) AS precinct, 'polygon' AS accuracy FROM election_districts" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/023-cortland/2012/election_districts.shp'

	# 027-dutchess. not 100% sure that DISTRICT is the right column
	ogr2ogr -sql "SELECT '2008' AS year, '36' AS state, '027' AS county, CONCAT('36027', CAST(DISTRICT AS character(20))) AS precinct, 'polygon' AS accuracy FROM DutchessCountyElectionDistricts" \
		-s_srs '+proj=longlat +datum=WGS84 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/027-dutchess/2008/DutchessCountyElectionDistricts.shp'
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '027' AS county, CONCAT('36027', CAST(DISTRICT AS character(20))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Dutchess\"" \
		-s_srs '+proj=longlat +ellps=GRS80 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/027-dutchess/2012/2012_EDs-Dutchess.shp'
	ogr2ogr -sql "SELECT '2015' AS year, '36' AS state, '027' AS county, CONCAT('36027', CAST(DISTRICT AS character(20))) AS precinct, 'polygon' AS accuracy FROM \"DutchessED3-6\"" \
		-s_srs '+proj=longlat +ellps=GRS80 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/027-dutchess/2014/DutchessED3-6.shp'

	# 029-erie
	ogr2ogr -sql "SELECT '2000' AS year, '36' AS state, '029' AS county, CONCAT('36029', CAST(OLMA_ AS character(20))) AS precinct, 'polygon' AS accuracy FROM election_2000" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-78.58333333333333 +k=0.9999375 +x_0=350000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/36-new-york/029-erie/2001/ny-erie-county-election_dist.zip/election_2000.shp'
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '029' AS county, CONCAT('36029', CAST(ED AS character(20))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Erie\"" \
		-s_srs '+proj=utm +zone=18 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/029-erie/2012/2012_EDs-Erie.shp'
	# the election district id's gained a left number padding this year, might require tweaking
	ogr2ogr -sql "SELECT '2015' AS year, '36' AS state, '029' AS county, CONCAT('36029', CAST(ED AS character(20))) AS precinct, 'polygon' AS accuracy FROM \"2015 ED Final\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/029-erie/2014/2015 ED Final.shp'

	# 031-essex
	ogr2ogr -sql "SELECT '2015' AS year, '36' AS state, '031' AS county, CONCAT('36031', CAST(DIST_NUM AS character(20))) AS precinct, 'polygon' AS accuracy FROM ED15" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-74.33333333333333 +k=0.9999666666666667 +x_0=152400.3048006096 +y_0=0 +datum=NAD27 +units=us-ft +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/031-essex/2014/ED15.shp'

	# 043-herkimer
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '043' AS county, CONCAT('36043', CAST(Name AS character(20))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Herkimer\"" \
		-s_srs '+proj=longlat +ellps=GRS80 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/043-herkimer/2012/2012_EDs-Herkimer.shp'

	# 055-monroe
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '055' AS county, CONCAT('36055', CAST(ED AS character(20))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Monroe\"" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-78.58333333333333 +k=0.9999375 +x_0=350000.0000000001 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/055-monroe/2012/2012_EDs-Monroe.shp'

	# 059-nassau
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '059' AS county, CONCAT('36059', CAST(419035 AS character(20))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Nassau\"" \
		-s_srs '+proj=utm +zone=18 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/059-nassau/2012/2012_EDs-Nassau.shp'
	ogr2ogr -sql "SELECT '2015' AS year, '36' AS state, '059' AS county, CONCAT('36059', CAST(ID AS character(20))) AS precinct, 'polygon' AS accuracy FROM \"Nassau County Election Districts\"" \
		-s_srs '+proj=longlat +ellps=GRS80 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/059-nassau/2014/Nassau County Election Districts.shp'
	ogr2ogr -sql "SELECT '2018' AS year, '36' AS state, '059' AS county, CONCAT('36059', CAST(DISTRICT AS character(20))) AS precinct, 'polygon' AS accuracy FROM \"Electin Districts\"" \
		-s_srs '+proj=longlat +ellps=GRS80 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/059-nassau/2018/Electin Districts.shp'

	# 061-new-york
	# Add New York City
	ogr2ogr -sql "SELECT '2014' AS year, '36' AS state, county, CONCAT('36', county, CAST(ElectDist AS character(5))) AS precinct, 'polygon' AS accuracy FROM nyed" \
		-s_srs '+proj=lcc +lat_1=40.66666666666666 +lat_2=41.03333333333333 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/061-new-york/2014/nyed.shp'
	ogr2ogr -sql "SELECT '2016' AS year, '36' AS state, county, CONCAT('36', county, CAST(ElectDist AS character(5))) AS precinct, 'polygon' AS accuracy FROM nyed" \
		-s_srs '+proj=lcc +lat_1=40.66666666666666 +lat_2=41.03333333333333 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/061-new-york/2016/nyed_16d/nyed.shp'
	ogr2ogr -sql "SELECT '2017' AS year, '36' AS state, county, CONCAT('36', county, CAST(ElectDist AS character(5))) AS precinct, 'polygon' AS accuracy FROM nyed" \
		-s_srs '+proj=lcc +lat_1=40.66666666666666 +lat_2=41.03333333333333 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/061-new-york/2017/nyed_17a/nyed.shp'

	# 063-niagara
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '063' AS county, CONCAT('36063', CAST(City_Town AS character(20)), CAST(District AS character(20))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Niagara\"" \
		-s_srs '+proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/063-niagara/2012/2012_EDs-Niagara.shp'

	# 065-oneida
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '065' AS county, CONCAT('36063', CAST(ID AS character(20))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Oneida\"" \
		-s_srs '+proj=longlat +ellps=GRS80 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/065-oneida/2012/2012_EDs-Oneida.shp'

	# 067-onondaga
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '067' AS county, CONCAT('36067', CAST(ELECT_DIST AS character(20))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Onondaga\"" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/067-onondaga/2012/2012_EDs-Onondaga.shp'
	ogr2ogr -sql "SELECT '2014' AS year, '36' AS state, '067' AS county, CONCAT('36067', CAST(ELECT_DIST AS character(20))) AS precinct, 'polygon' AS accuracy FROM election_districts" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/067-onondaga/2014/election_districts.shp'

	# Add 069-ontario
	ogr2ogr -sql "SELECT '2015' AS year, '36' AS state, '069' AS county, CONCAT('36069', CAST(JOINCODE AS character(10))) AS precinct, 'polygon' AS accuracy FROM BOE_Election_Districts" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/069-ontario/2014/BOE_Election_Districts.shp'
	ogr2ogr -sql "SELECT '2017' AS year, '36' AS state, '069' AS county, CONCAT('36069', CAST(JOINCODE AS character(10))) AS precinct, 'polygon' AS accuracy FROM BOE_Election_Districts" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/36-new-york/069-ontario/2016/BOE_Election_Districts_201605180903412713.zip/BOE_Election_Districts.shp'

	# 071-orange
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '071' AS county, CONCAT('36071', CAST(ELE_DIS AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Orange\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/071-orange/2012/2012_EDs-Orange.shp'
	ogr2ogr -sql "SELECT '2014' AS year, '36' AS state, '071' AS county, CONCAT('36071', CAST(ELE_DIS AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"OC_ElectionDistricts2014\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/071-orange/2014/OC_ElectionDistricts2014.shp'

	# 073-orleans
	ogr2ogr -sql "SELECT '2008' AS year, '36' AS state, '073' AS county, CONCAT('36073', CAST(ID_ AS character(10))) AS precinct, 'polygon' AS accuracy FROM ALBIVOTE" \
		-s_srs '+proj=longlat +ellps=clrk66 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/073-orleans/2008/ALBIVOTE.SHP'
	ogr2ogr -sql "SELECT '2008' AS year, '36' AS state, '073' AS county, CONCAT('36073', CAST(ID_ AS character(10))) AS precinct, 'polygon' AS accuracy FROM CLARVOTE" \
		-s_srs '+proj=longlat +ellps=clrk66 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/073-orleans/2008/CLARVOTE.SHP'
	ogr2ogr -sql "SELECT '2008' AS year, '36' AS state, '073' AS county, CONCAT('36073', CAST(ID_ AS character(10))) AS precinct, 'polygon' AS accuracy FROM MURRVOTE" \
		-s_srs '+proj=longlat +ellps=clrk66 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/073-orleans/2008/MURRVOTE.SHP'
	ogr2ogr -sql "SELECT '2008' AS year, '36' AS state, '073' AS county, CONCAT('36073', CAST(ID_ AS character(10))) AS precinct, 'polygon' AS accuracy FROM BARRVOTE" \
		-s_srs '+proj=longlat +ellps=clrk66 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/073-orleans/2008/BARRVOTE.SHP'
	ogr2ogr -sql "SELECT '2008' AS year, '36' AS state, '073' AS county, CONCAT('36073', CAST(ID_ AS character(10))) AS precinct, 'polygon' AS accuracy FROM GAINVOTE" \
		-s_srs '+proj=longlat +ellps=clrk66 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/073-orleans/2008/GAINVOTE.SHP'
	ogr2ogr -sql "SELECT '2008' AS year, '36' AS state, '073' AS county, CONCAT('36073', CAST(ID_ AS character(10))) AS precinct, 'polygon' AS accuracy FROM SHELVOTE" \
		-s_srs '+proj=longlat +ellps=clrk66 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/073-orleans/2008/SHELVOTE.SHP'
	ogr2ogr -sql "SELECT '2008' AS year, '36' AS state, '073' AS county, CONCAT('36073', CAST(ID_ AS character(10))) AS precinct, 'polygon' AS accuracy FROM CARLVOTE" \
		-s_srs '+proj=longlat +ellps=clrk66 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/073-orleans/2008/CARLVOTE.SHP'
	ogr2ogr -sql "SELECT '2008' AS year, '36' AS state, '073' AS county, CONCAT('36073', CAST(ID_ AS character(10))) AS precinct, 'polygon' AS accuracy FROM KENDVOTE" \
		-s_srs '+proj=longlat +ellps=clrk66 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/073-orleans/2008/KENDVOTE.SHP'
	ogr2ogr -sql "SELECT '2008' AS year, '36' AS state, '073' AS county, CONCAT('36073', CAST(ID_ AS character(10))) AS precinct, 'polygon' AS accuracy FROM YATEVOTE" \
		-s_srs '+proj=longlat +ellps=clrk66 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/073-orleans/2008/YATEVOTE.SHP'
	ogr2ogr -sql "SELECT '2008' AS year, '36' AS state, '073' AS county, CONCAT('36073', CAST(ID_ AS character(10))) AS precinct, 'polygon' AS accuracy FROM Ridgevote" \
		-s_srs '+proj=longlat +ellps=clrk66 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/073-orleans/2008/Ridgevote.shp'

	# 075-oswego
	ogr2ogr -sql "SELECT '2015' AS year, '36' AS state, '075' AS county, CONCAT('36075', CAST(LONGNAME AS character(10))) AS precinct, 'polygon' AS accuracy FROM funal_run_4" \
		-s_srs '+proj=longlat +datum=WGS84 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/075-oswego/2014/funal_run_4.shp'

	# 077-ostego
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '077' AS county, CONCAT('36077', CAST(ID AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"Otsego_Voting_2012_Final\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/077-otsego/2012/Otsego_Voting_2012_Final.shp'

	# 079-putnam. ELECT_CTY_ vs ELECT_CTY_1_ ?
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '079' AS county, CONCAT('36079', CAST(ELECT_CTY_ AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Putnam\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/079-putnam/2012/2012_EDs-Putnam.shp'


	# Add 083-rensselaer
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '083' AS county, CONCAT('36083', CAST(ED AS character(10))) AS precinct, 'polygon' AS accuracy FROM cnty_election_districts" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/083-rensselaer/2012/cnty_election_districts.shp'
	ogr2ogr -sql "SELECT '2014' AS year, '36' AS state, '083' AS county, CONCAT('36083', CAST(ED AS character(10))) AS precinct, 'polygon' AS accuracy FROM cnty_ed" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/083-rensselaer/2014/cnty_ed.shp'
	ogr2ogr -sql "SELECT '2017' AS year, '36' AS state, '083' AS county, CONCAT('36083', CAST(ED AS character(20))) AS precinct, 'polygon' AS accuracy FROM cnty_ed" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/36-new-york/083-rensselaer/2016/ren-cnty_ed.zip/cnty_ed.shp'

	# 087-rockland
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '087' AS county, CONCAT('36087', CAST(ED_NUM AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Rockland\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/087-rockland/2012/2012_EDs-Rockland.shp'
	ogr2ogr -sql "SELECT '2016' AS year, '36' AS state, '087' AS county, CONCAT('36087', CAST(ED_NUM AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"Cty_ED_Jan_15_2016\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/087-rockland/2016/Cty_ED_Jan_15_2016.shp'

	# 089-st-lawrence
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '089' AS county, CONCAT('36089', CAST(DIST_ID AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-St_Lawrence\"" \
		-s_srs '+proj=utm +zone=18 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/089-st-lawrence/2012/2012_EDs-St_Lawrence.shp'

	# 093-schenectady
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '093' AS county, CONCAT('36093', CAST(DISTRICT AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Duanesburg\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/093-schenectady/2012/2012_EDs-Duanesburg.shp'
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '093' AS county, CONCAT('36093', CAST(DISTRICT AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Glenville\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/093-schenectady/2012/2012_EDs-Glenville.shp'
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '093' AS county, CONCAT('36093', CAST(DISTRICT AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Niskayuna\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/093-schenectady/2012/2012_EDs-Niskayuna.shp'
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '093' AS county, CONCAT('36093', CAST(DISTRICT AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Princetown\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/093-schenectady/2012/2012_EDs-Princetown.shp'
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '093' AS county, CONCAT('36093', CAST(DISTRICT AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Rotterdam\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/093-schenectady/2012/2012_EDs-Rotterdam.shp'
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '093' AS county, CONCAT('36093', CAST(DISTRICT_ AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Schenectady_\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/093-schenectady/2012/2012_EDs-Schenectady_.shp'

	# 095-schoharie
	ogr2ogr -sql "SELECT '2013' AS year, '36' AS state, '095' AS county, CONCAT('36095', CAST(Dist_ AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"ElectionDists\"" \
		-s_srs '+proj=utm +zone=18 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/095-schoharie/2012/ElectionDists.shp'

	# 101-steuben
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '101' AS county, CONCAT('36101', CAST(VOTEDIST_I AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Steuben\"" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/101-steuben/2012/2012_EDs-Steuben.shp'
	ogr2ogr -sql "SELECT '2014' AS year, '36' AS state, '101' AS county, CONCAT('36101', CAST(VOTEDIST_I AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"ElectionDistricts\"" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/101-steuben/2014/ElectionDistricts.shp'

	# 103-suffolk
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '103' AS county, CONCAT('36103', CAST(ED AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012 ED Files\"" \
		-s_srs '+proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/103-suffolk/2012/2012 ED Files.shp'

	# 107-tioga
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '107' AS county, CONCAT('36107', CAST(VDISTRICT AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Tioga\"" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/107-tioga/2012/2012_EDs-Tioga.shp'

	# 109-tompkins
	ogr2ogr -sql "SELECT '2014' AS year, '36' AS state, '109' AS county, CONCAT('36109', CAST(DISTNAME AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"ElDistricts2014\"" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/109-tompkins/2014/ElDistricts2014.shp'

	# 111-ulster
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '111' AS county, CONCAT('36111', CAST(DISTRICT AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Ulster\"" \
		-s_srs 'EPSG:2260' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/111-ulster/2012/2012_EDs-Ulster.shp'

	# 113-warren
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '113' AS county, CONCAT('36113', CAST(DISTRICT AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Warren\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/113-warren/2012/2012_EDs-Warren.shp'

	# 115-washington
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '115' AS county, CONCAT('36115', CAST(TOWN AS character(10)), CAST(DISTRICT AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Washington\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/115-washington/2012/2012_EDs-Washington.shp'
	ogr2ogr -sql "SELECT '2015' AS year, '36' AS state, '115' AS county, CONCAT('36115', CAST(TOWN AS character(10)), CAST(DISTRICT AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"election_districts\"" \
		-s_srs EPSG:2260 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/115-washington/2014/election_districts.shp'

	# 119-westchester
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '119' AS county, CONCAT('36119', CAST(ED AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Westchester\"" \
		-s_srs '+proj=longlat +ellps=GRS80 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/119-westchester/2012/2012_EDs-Westchester.shp'
	ogr2ogr -sql "SELECT '2014' AS year, '36' AS state, '119' AS county, CONCAT('36119', CAST(ED AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"Westchester 2014 Election Districts\"" \
		-s_srs '+proj=longlat +ellps=GRS80 +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/119-westchester/2014/Westchester 2014 Election Districts.shp'

	# 123-yates
	ogr2ogr -sql "SELECT '2012' AS year, '36' AS state, '123' AS county, CONCAT('36123', CAST(District AS character(10))) AS precinct, 'polygon' AS accuracy FROM \"2012_EDs-Yates\"" \
		-s_srs '+proj=tmerc +lat_0=40 +lon_0=-76.58333333333333 +k=0.9999375 +x_0=250000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'data/36-new-york/123-yates/2012/2012_EDs-Yates.shp'

out/37-north-carolina/state.gpkg: data/37-north-carolina/statewide/2016/SBE_PRECINCTS_20160826.zip data/template.shp
	mkdir -p out/37-north-carolina
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '37' AS state, CONCAT('37', SUBSTR(CONCAT('000', CAST(COUNTY_ID AS character(20))), -3)) AS county, CONCAT('37', SUBSTR(CONCAT('000', CAST(COUNTY_ID AS character(20))), -3), PREC_ID) AS precinct, 'polygon' AS accuracy FROM Precincts" \
		-s_srs '+proj=lcc +lat_1=34.33333333333334 +lat_2=36.16666666666666 +lat_0=33.75 +lon_0=-79 +x_0=609601.2199999997 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/37-north-carolina/statewide/2016/SBE_PRECINCTS_20160826.zip/Precincts.shp'

out/38-north-dakota/state.gpkg: data/38-north-dakota/statewide/2010/tl_2012_38_vtd10.zip \
	data/38-north-dakota/38017-cass/2017/cassprecinct.zip \
	data/template.shp
	mkdir -p out/38-north-dakota
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_38_vtd10 WHERE COUNTYFP10 NOT IN ('017')" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/38-north-dakota/statewide/2010/tl_2012_38_vtd10.zip/tl_2012_38_vtd10.shp'
	
	# Add Cass County
	ogr2ogr -sql "SELECT '2017' AS year, '38' AS state, '017' AS county, CONCAT('38017', CAST(PRECINCT AS character(10))) AS precinct, 'polygon' AS accuracy FROM cassprecinct" \
		-s_srs '+proj=lcc +lat_1=46.18333333333333 +lat_2=47.48333333333333 +lat_0=45.66666666666666 +lon_0=-100.5 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/38-north-dakota/38017-cass/2017/cassprecinct.zip/cassprecinct.shp'

out/39-ohio/state.gpkg: data/39-ohio/statewide/2016/precincts_results.shp \
						data/template.shp
	mkdir -p out/39-ohio
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '39' AS state, CONCAT('39', CNTY_NAME) AS county, CAST(PREC_SHP AS character(30)) AS precinct, 'polygon' AS accuracy FROM precincts_results" \
		-s_srs EPSG:26917 -t_srs EPSG:4326 -nln state -append -f GPKG $@ 'data/39-ohio/statewide/2016/precincts_results.shp'

out/40-oklahoma/state.gpkg: data/40-oklahoma/statewide/2016/pct_2010.zip data/template.shp
	mkdir -p out/40-oklahoma
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '40' AS state, CONCAT('40', SUBSTR(CONCAT('000', COUNTY), -3)) AS county, CONCAT('40', CONCAT('40', SUBSTR(CONCAT('000', COUNTY), -3)), PCT_CEB) AS precinct, 'polygon' AS accuracy FROM pct_2010" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/40-oklahoma/statewide/2016/pct_2010.zip/pct_2010.shp'

out/41-oregon/state.gpkg: data/41-oregon/metro-portland/2016/precinct.zip data/41-oregon/statewide/2012/ORprecinctsPublic-2012.zip data/41-oregon/statewide/2016/OR_2016.zip \
	data/template.shp
	mkdir -p out/41-oregon
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG 'out/41-oregon/staging.gpkg' data/template.shp
	#
	# Census 2010 doesn't have good coverage in Oregon!?
	# Skip Portland Metro area counties (FIPS 157) since it'll come from another file.
	#ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_18_vtd10 WHERE COUNTYFP10 != '157'" \
	#	-s_srs EPSG:4269 -t_srs EPSG:4326 -overwrite -nln state -nlt MultiPolygon -f GPKG $@ out/18-indiana/source/tl_2012_18_vtd10.shp
	#
	# Get most counties from 2016 file
	# Except: (2016) 'Multnomah', 'Washington', 'Clackamas'
	# Except: (2012) 'Baker'
	# Except: (no-data) 'Lake', 'Lincoln', 'Tillamook', 'Union', 'Wallowa', 'Wheeler'
        # Keep: (remainders) 'Benton', 'Clatsop', 'Columbia', 'Coos', 'Crook', 'Curry', 'Deschutes', 'Douglas', 'Gilliam', 'Grant', 'Harney', 'Hood River', 'Jackson', 'Jefferson', 'Josephine', 'Klamath', 'Lane', 'Linn', 'Malheur', 'Marion', 'Morrow', 'Polk', 'Sherman', 'Umatilla', 'Wasco', 'Yamhill'
	ogr2ogr -sql "SELECT '2016' AS year, '41' AS state, CASE OROnly_P_2 WHEN 'Benton' THEN '003' WHEN 'Clatsop' THEN '007' WHEN 'Columbia' THEN '009' WHEN 'Coos' THEN '011' WHEN 'Crook' THEN '013' WHEN 'Curry' THEN '015' WHEN 'Deschutes' THEN '017' WHEN 'Douglas' THEN '019' WHEN 'Gilliam' THEN '021' WHEN 'Grant' THEN '023' WHEN 'Harney' THEN '025' WHEN 'Hood River' THEN '027' WHEN 'Jackson' THEN '029' WHEN 'Jefferson' THEN '031' WHEN 'Josephine' THEN '033' WHEN 'Klamath' THEN '035' WHEN 'Lane' THEN '039' WHEN 'Linn' THEN '043' WHEN 'Malheur' THEN '045' WHEN 'Marion' THEN '047' WHEN 'Morrow' THEN '049' WHEN 'Polk' THEN '053' WHEN 'Sherman' THEN '055' WHEN 'Umatilla' THEN '059' WHEN 'Wasco' THEN '065' WHEN 'Yamhill' THEN '071' ELSE NULL END AS county, OROnly_Pre AS precinct, 'polygon' AS accuracy, GEOMETRY AS geometry FROM ORWA_2016 WHERE ( OROnly_P_2 IN ('Benton', 'Clatsop', 'Columbia', 'Coos', 'Crook', 'Curry', 'Deschutes', 'Douglas', 'Gilliam', 'Grant', 'Harney', 'Hood River', 'Jackson', 'Jefferson', 'Josephine', 'Klamath', 'Lane', 'Linn', 'Malheur', 'Marion', 'Morrow', 'Polk', 'Sherman', 'Umatilla', 'Wasco', 'Yamhill'))" \
                -dialect SQLITE \
		-s_srs EPSG:4326 \
		-t_srs EPSG:4326 -nln state -append -f GPKG -nln state 'out/41-oregon/staging.gpkg' \
		'/vsizip/data/41-oregon/statewide/2016/OR_2016.zip/ORWA_2016.shp'
	#
	# 2012: add detail in Baker county
        # Note that Baker County's FIPS code is 001
	ogr2ogr -sql "SELECT '2012' AS year, '41' AS state, '001' AS county, PRECNAME AS precinct, 'polygon' AS accuracy, GEOMETRY AS geometry FROM ORprecinctsPublic WHERE COUNTY='Baker'" \
                -dialect SQLITE \
		-s_srs '+proj=lcc +lat_1=44.33333333333334 +lat_2=46 +lat_0=43.66666666666666 +lon_0=-120.5 +x_0=2500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG -nln state 'out/41-oregon/staging.gpkg' \
		'/vsizip/data/41-oregon/statewide/2012/ORprecinctsPublic-2012.zip/ORprecinctsPublic.shp'
	#
	# 2016: Add Portland Metro area counties (Multnomah, Washington, and Clackamas) to the statewide Geopackage file.
	ogr2ogr -sql "SELECT '2016' AS year, '41' AS state, CASE COUNTY WHEN 'C' THEN '005' WHEN 'M' THEN '051' WHEN 'W' THEN '067' ELSE NULL END AS county, PRECINCT AS precinct, 'polygon' AS accuracy, GEOMETRY AS geometry FROM precinct" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln state -append -f GPKG -nln state -nlt MultiPolygon \
		'out/41-oregon/staging.gpkg' \
		'/vsizip/data/41-oregon/metro-portland/2016/precinct.zip/precinct.shp'

        # Rename counties to FIPS codes and standardize precinct IDs
        # We want to standardize precinct IDs broadly as CONCAT(state_fips, county_fips, precinct_code)
        # Oregon precincts take several forms: (a) OR_UMATILLA_106R, (b) OR_MORROW_3, (c) OR_MARION_NA, (c) Unity, (d) 351
        # (a) We want to left-pad everything after the last _ to length 5 with 0
        # (b) We want to left-pad everything after the last _ to length 4 with 0
        # (c) We want to take everything after the last _
        # (d) We want to take everything
        # (e) We want to left-pad everything to length 4 with 0
        # The above cases are handled in the given order in the CASE statement below for creating the `precinct_code' portion of the `precinct' field
	ogr2ogr -sql "SELECT year AS year, state AS state, county AS county, state || county || CASE WHEN precinct GLOB '*_*_[0-9]*[A-Z]' THEN SUBSTR('0000' || SUBSTR(precinct, 4+INSTR(SUBSTR(precinct, 4), '_')), -5) WHEN precinct GLOB '*_*_[0-9]*' THEN SUBSTR('0000' || SUBSTR(precinct, 4+INSTR(SUBSTR(precinct, 4), '_')), -4) WHEN precinct GLOB '*_*_*' THEN SUBSTR(precinct, 4+INSTR(SUBSTR(precinct, 4), '_')) WHEN precinct GLOB '[A-Z]*' THEN precinct ELSE SUBSTR('0000' || precinct, -4) END AS precinct, 'polygon' AS accuracy, geom AS geom FROM state" \
		-dialect SQLITE \
		-s_srs EPSG:4326 \
		-t_srs EPSG:4326 -nln state -f GPKG -nlt MultiPolygon \
		$@ 'out/41-oregon/staging.gpkg'

	rm -rf 'out/41-oregon/staging.gpkg'

out/42-pennsylvania/state.gpkg: data/42-pennsylvania/statewide/2017/VTDs_Oct17.zip data/template.shp
	mkdir -p out/42-pennsylvania
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp

	# Pennsylvania uses county names as labels. Use a CASE statement to
	# assign them to their proper FIPS codes.
	ogr2ogr -sql "SELECT '2016' AS year, '42' AS state, CASE COUNTYNAME WHEN 'Adams' THEN '001' WHEN 'Allegheny' THEN '003' WHEN 'Armstrong' THEN '005' WHEN 'Beaver' THEN '007' WHEN 'Bedford' THEN '009' WHEN 'Berks' THEN '011' WHEN 'Blair' THEN '013' WHEN 'Bradford' THEN '015' WHEN 'Bucks' THEN '017' WHEN 'Butler' THEN '019' WHEN 'Cambria' THEN '021' WHEN 'Cameron' THEN '023' WHEN 'Carbon' THEN '025' WHEN 'Centre' THEN '027' WHEN 'Chester' THEN '029' WHEN 'Clarion' THEN '031' WHEN 'Clearfield' THEN '033' WHEN 'Clinton' THEN '035' WHEN 'Columbia' THEN '037' WHEN 'Crawford' THEN '039' WHEN 'Cumberland' THEN '041' WHEN 'Dauphin' THEN '043' WHEN 'Delaware' THEN '045' WHEN 'Elk' THEN '047' WHEN 'Erie' THEN '049' WHEN 'Fayette' THEN '051' WHEN 'Forest' THEN '053' WHEN 'Franklin' THEN '055' WHEN 'Fulton' THEN '057' WHEN 'Greene' THEN '059' WHEN 'Huntingdon' THEN '061' WHEN 'Indiana' THEN '063' WHEN 'Jefferson' THEN '065' WHEN 'Juniata' THEN '067' WHEN 'Lackawanna' THEN '069' WHEN 'Lancaster' THEN '071' WHEN 'Lawrence' THEN '073' WHEN 'Lebanon' THEN '075' WHEN 'Lehigh' THEN '077' WHEN 'Luzerne' THEN '079' WHEN 'Lycoming' THEN '081' WHEN 'McKean' THEN '083' WHEN 'Mercer' THEN '085' WHEN 'Mifflin' THEN '087' WHEN 'Monroe' THEN '089' WHEN 'Montgomery' THEN '091' WHEN 'Montour' THEN '093' WHEN 'Northampton' THEN '095' WHEN 'Northumberland' THEN '097' WHEN 'Perry' THEN '099' WHEN 'Philadelphia' THEN '101' WHEN 'Pike' THEN '103' WHEN 'Potter' THEN '105' WHEN 'Schuylkill' THEN '107' WHEN 'Snyder' THEN '109' WHEN 'Somerset' THEN '111' WHEN 'Sullivan' THEN '113' WHEN 'Susquehanna' THEN '115' WHEN 'Tioga' THEN '117' WHEN 'Union' THEN '119' WHEN 'Venango' THEN '121' WHEN 'Warren' THEN '123' WHEN 'Washington' THEN '125' WHEN 'Wayne' THEN '127' WHEN 'Westmoreland' THEN '129' WHEN 'Wyoming' THEN '131' WHEN 'York' THEN '133' ELSE COUNTYNAME END AS county, VTD_NAME AS precinct, 'polygon' AS accuracy, GEOMETRY as geometry FROM VTDs_Oct17" \
		-dialect SQLITE \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/42-pennsylvania/statewide/2017/VTDs_Oct17.zip/VTDs_Oct17.shp'

out/45-south-carolina/state.gpkg: data/45-south-carolina/statewide/2013/sc-statewide-2013.zip data/template.shp
	mkdir -p out/45-south-carolina
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2013' AS year, '45' AS state, CONCAT('45', SUBSTR(CONCAT('000', COUNTY), -3)) AS county, CONCAT('45', SUBSTR(CONCAT('000', COUNTY), -3), PCode) AS precinct, 'polygon' AS accuracy FROM Statewide" \
		-s_srs EPSG:4019 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/45-south-carolina/statewide/2013/sc-statewide-2013.zip/Statewide.shp'

out/46-south-dakota/state.gpkg: data/46-south-dakota/statewide/2010/tl_2012_46_vtd10.zip data/template.shp
	mkdir -p out/46-south-dakota
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_46_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/46-south-dakota/statewide/2010/tl_2012_46_vtd10.zip/tl_2012_46_vtd10.shp'

out/47-tennessee/state.gpkg: data/47-tennessee/statewide/2016/tn_2016_FEST.zip data/template.shp
	mkdir -p out/47-tennessee
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '47' AS state, '000' AS county, vtd AS precinct, name as name FROM tn_2016" \
		-s_srs '+proj=lcc +lat_1=35.25 +lat_2=36.41666666666666 +lat_0=34.33333333333334 +lon_0=-86 +x_0=600000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/47-tennessee/statewide/2016/tn_2016_FEST.zip/tn_2016.shp'

out/48-texas/state.gpkg: data/48-texas/statewide/2016/Precincts.zip data/template.shp
	mkdir -p out/48-texas
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '48' AS state, CONCAT('48', SUBSTR(CONCAT('000', CAST(CNTY AS character(3))), -3)) AS county, CONCAT('48', SUBSTR(CONCAT('000', CAST(CNTY AS character(3))), -3), CAST(PREC AS character(10))) AS precinct, 'polygon' AS accuracy FROM Precincts" \
		-s_srs EPSG:3081 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/48-texas/statewide/2016/Precincts.zip/Precincts.shp'

out/49-utah/state.gpkg: data/49-utah/statewide/2016/VistaBallotAreas_shp.zip data/template.shp
	mkdir -p out/49-utah
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '49' AS state, CONCAT('49', SUBSTR(CONCAT('000', CAST(CountyID AS CHARACTER(3))), -3)) AS county, CONCAT('49', SUBSTR(CONCAT('000', CAST(CountyID AS CHARACTER(3))), -3), VistaID) AS precinct, 'polygon' AS accuracy FROM VistaBallotAreas" \
		-s_srs EPSG:26912 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/49-utah/statewide/2016/VistaBallotAreas_shp.zip/VistaBallotAreas/VistaBallotAreas.shp'

out/50-vermont/state.gpkg: data/50-vermont/statewide/2012/Voting_Tabulation_Areas_2012.zip data/template.shp
	mkdir -p out/50-vermont
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '50' AS state, CONCAT('50', SUBSTR(CONCAT('000', CAST(CNTY AS character(3))), -3)) AS county, CONCAT('50', SUBSTR(CONCAT('000', CAST(CNTY AS character(3))), -3), CAST(NAME AS character(10))) AS precinct, 'polygon' AS accuracy FROM BoundaryOther_VOTETAB2012" \
		-s_srs '+proj=tmerc +lat_0=42.5 +lon_0=-72.5 +k=0.9999642857142857 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs' \
		-t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/50-vermont/statewide/2012/Voting_Tabulation_Areas_2012.zip/BoundaryOther_VOTETAB2012.shp'

out/51-virginia/state.gpkg: data/51-virginia/statewide/2016/vaprecincts2016.shp data/template.shp
	mkdir -p out/51-virginia
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp


	# This file uses county names as county identifiers and
	# `$state_fips$county_fips$precinct_code` as precinct codes. Rather
	# than using a big case statement to determine county fips, it is simply
	# extracted from the precinct ID. Also, for maximal cross-compatibility,
	# we prefer to have 4-digit numeric precinct codes, so we left-pad the
	# existing 3-digit precinct code with exactly one '0'.
	ogr2ogr -sql "SELECT 2016 AS year, '51' AS state, SUBSTR(id, 3, 3) AS county, SUBSTR(id, 1, 5) || '0' || SUBSTR(id, 6, 3) AS precinct, 'polygon' AS accuracy, GEOMETRY as geometry FROM vaprecincts2016" \
		-dialect SQLITE \
		-s_srs EPSG:3857 -t_srs EPSG:4326 -nln state -append -f GPKG $@ $<

out/53-washington/state.gpkg: data/53-washington/statewide/2016/statewide_prec_2016_nowater.geojson.zip data/template.shp
	mkdir -p out/53-washington
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '53' AS state, CASE COUNTY WHEN 'Adams' THEN '001' WHEN 'Asotin' THEN '003' WHEN 'Benton' THEN '005' WHEN 'Chelan' THEN '007' WHEN 'Clallam' THEN '009' WHEN 'Clark' THEN '011' WHEN 'Columbia' THEN '013' WHEN 'Cowlitz' THEN '015' WHEN 'Douglas' THEN '017' WHEN 'Ferry' THEN '019' WHEN 'Franklin' THEN '021' WHEN 'Garfield' THEN '023' WHEN 'Grant' THEN '025' WHEN 'Grays Harbor' THEN '027' WHEN 'Island' THEN '029' WHEN 'Jefferson' THEN '031' WHEN 'King' THEN '033' WHEN 'Kitsap' THEN '035' WHEN 'Kittitas' THEN '037' WHEN 'Klickitat' THEN '039' WHEN 'Lewis' THEN '041' WHEN 'Lincoln' THEN '043' WHEN 'Mason' THEN '045' WHEN 'Okanogan' THEN '047' WHEN 'Pacific' THEN '049' WHEN 'Pend Oreille' THEN '051' WHEN 'Pierce' THEN '053' WHEN 'San Juan' THEN '055' WHEN 'Skagit' THEN '057' WHEN 'Skamania' THEN '059' WHEN 'Snohomish' THEN '061' WHEN 'Spokane' THEN '063' WHEN 'Stevens' THEN '065' WHEN 'Thurston' THEN '067' WHEN 'Wahkiakum' THEN '069' WHEN 'Walla Walla' THEN '071' WHEN 'Whatcom' THEN '073' WHEN 'Whitman' THEN '075' WHEN 'Yakima' THEN '077' ELSE COUNTY END AS county, ST_CODE AS precinct, 'polygon' AS accuracy, GEOMETRY AS geometry FROM statewide_prec_2016_nowater" \
		-dialect SQLITE \
		-nln state -append -f GPKG $@ \
		'/vsizip/data/53-washington/statewide/2016/statewide_prec_2016_nowater.geojson.zip/statewide_prec_2016_nowater.geojson'

out/54-west-virginia/state.gpkg: data/54-west-virginia/statewide/2011/VotingDistrict_Census_201105_GCS83.zip data/template.shp
	mkdir -p out/54-west-virginia
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2011' AS year, '54' AS state, COUNTYFP10 AS county, VTDST10 AS precinct, 'polygon' AS accuracy FROM VotingDistrict_Census_201105_GCS83" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/54-west-virginia/statewide/2011/VotingDistrict_Census_201105_GCS83.zip/VotingDistrict_Census_201105_GCS83.shp'

out/55-wisconsin/state.gpkg: data/55-wisconsin/statewide/2016/wi_2016_FEST.zip data/template.shp
	mkdir -p out/55-wisconsin
	# GPKG allows multiple layers, and since the original poor 2016 layer was generic GeoJSON, adding the 2014 polygon resulted in 2 layers!
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2016' AS year, '55' AS state, CNTY_FIPS AS county, GEOID AS precinct, 'polygon' AS accuracy FROM wi_2016" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/55-wisconsin/statewide/2016/wi_2016_FEST.zip/wi_2016.shp'

out/56-wyoming/state.gpkg: data/56-wyoming/statewide/2010/2010_wy_precincts.zip data/template.shp
	mkdir -p out/56-wyoming
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2010' AS year, '56' AS state, COUNTYFP10 AS county, NAMELSAD10 AS precinct, 'polygon' AS accuracy FROM WY_final" \
		-s_srs EPSG:4326 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/56-wyoming/statewide/2010/2010_wy_precincts.zip/WY_final.shp'

out/72-puerto-rico/state.gpkg: data/72-puerto-rico/statewide/2010/tl_2012_72_vtd10.zip data/template.shp
	mkdir -p out/72-puerto-rico
	# GPKG are weird
	rm -f $@
	ogr2ogr -s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -overwrite -f GPKG $@ data/template.shp
	ogr2ogr -sql "SELECT '2010' AS year, STATEFP10 AS state, COUNTYFP10 AS county, GEOID10 AS precinct, 'polygon' AS accuracy FROM tl_2012_72_vtd10" \
		-s_srs EPSG:4269 -t_srs EPSG:4326 -nln state -append -f GPKG $@ \
		'/vsizip/data/72-puerto-rico/statewide/2010/tl_2012_72_vtd10.zip/tl_2012_72_vtd10.shp'
