#!/bin/bash
shapefiles=(
	data/36-new-york/061-new-york/2014/nyed.shp
	data/36-new-york/061-new-york/2016/nyed_16d/nyed.shp
	data/36-new-york/061-new-york/2017/nyed_17a/nyed.shp
)
for i in ${!shapefiles[@]}
do
    file="${shapefiles[i]}"
    ogrinfo -sql "ALTER TABLE nyed DROP COLUMN county" $file
    ogrinfo -sql "ALTER TABLE nyed ADD COLUMN county character(3)" $file
    ogrinfo -dialect SQLite -sql "UPDATE nyed SET county = '081' WHERE ElectDist >= 23000 AND ElectDist <= 40999" $file
    ogrinfo -dialect SQLite -sql "UPDATE nyed SET county = '047' WHERE ElectDist >= 41000 AND ElectDist <= 60999" $file
    ogrinfo -dialect SQLite -sql "UPDATE nyed SET county = '085' WHERE ElectDist >= 61000 AND ElectDist <= 64070" $file
    ogrinfo -dialect SQLite -sql "UPDATE nyed SET county = '047' WHERE ElectDist >= 64071 AND ElectDist <= 64999" $file
    ogrinfo -dialect SQLite -sql "UPDATE nyed SET county = '061' WHERE ElectDist >= 65000 AND ElectDist <= 76999" $file
    ogrinfo -dialect SQLite -sql "UPDATE nyed SET county = '005' WHERE ElectDist >= 77000 AND ElectDist <= 88000" $file
done
