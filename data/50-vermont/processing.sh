wget -O VT_House_Districts_2012__polygons.zip https://opendata.arcgis.com/datasets/cad7983039d14ef69572df7e4a9eff0a_25.zip?outSR=%7B%22wkid%22%3A32145%2C%22latestWkid%22%3A32145%7D
wget -O VT_House_Districts_2002__polygons.zip https://opendata.arcgis.com/datasets/35d685ac7777483cb6a60dd4de66629c_26.zip?outSR=%7B%22wkid%22%3A32145%2C%22latestWkid%22%3A32145%7D
wget -O VT_Senate_Districts_1992__polygons.zip https://opendata.arcgis.com/datasets/1ef546f2537f4d91a678b124b5b44ebd_21.zip?outSR=%7B%22wkid%22%3A32145%2C%22latestWkid%22%3A32145%7D
wget -O VT_Senate_Districts_2002.zip https://opendata.arcgis.com/datasets/9faae2810b20485ab0a7bbfb0a1aae89_20.zip?outSR=%7B%22wkid%22%3A32145%2C%22latestWkid%22%3A32145%7D
wget -O VT_Senate_Districts_2012.zip https://opendata.arcgis.com/datasets/c61a30f5e1a54230b802204eadd660c3_19.zip?outSR=%7B%22wkid%22%3A32145%2C%22latestWkid%22%3A32145%7D

for i in $(ls *.zip); do
  ROOT=${i%%.*}
  unzip $ROOT.zip
  ogr2ogr -t_srs "EPSG:4326" -f "geojson" ${ROOT}_wgs84.geojson $ROOT.shp
done