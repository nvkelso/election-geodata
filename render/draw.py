#!/usr/bin/env python
import mapnik, sys, os

conus_path, alaska_path, hawaii_path, render_path = map(os.path.abspath, sys.argv[1:])
os.chdir(os.path.dirname(__file__))

map1 = mapnik.Map(1780, 1250)
mapnik.load_map(map1, 'style.xml')
bbox=(mapnik.Envelope(-2700000, -2800000, 2570000, 770000))
map1.zoom_to_box(bbox)
mapnik.render_to_file(map1, conus_path)

map2 = mapnik.Map(580, 480)
mapnik.load_map(map2, 'style.xml')
bbox=(mapnik.Envelope(-4400000, 1350000, -1450000, 3850000))
map2.zoom_to_box(bbox)
mapnik.render_to_file(map2, alaska_path)

map3 = mapnik.Map(300, 340)
mapnik.load_map(map3, 'style.xml')
bbox=(mapnik.Envelope(-5800000, -1100000, -5400000, -380000))
map3.zoom_to_box(bbox)
mapnik.render_to_file(map3, hawaii_path)
