#!/usr/bin/env python
import mapnik, sys, os

png_filename = os.path.abspath(sys.argv[1])
os.chdir(os.path.dirname(__file__))

map = mapnik.Map(1780, 1250)
mapnik.load_map(map, 'style.xml')
bbox=(mapnik.Envelope(-2700000, -2800000, 2570000, 770000))
map.zoom_to_box(bbox)
mapnik.render_to_file(map, png_filename)
