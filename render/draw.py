#!/usr/bin/env python
import mapnik, sys, os

png_filename = os.path.abspath(sys.argv[1])
os.chdir(os.path.dirname(__file__))

map = mapnik.Map(3072, 2048)
mapnik.load_map(map, 'style.xml')
bbox=(mapnik.Envelope(-2110000, -2170000, 2570000, 770000))
map.zoom_to_box(bbox)
mapnik.render_to_file(map, png_filename)
