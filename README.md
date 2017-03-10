# election-geodata
Precinct shapes (and vote results) for US elections past, present, and future

I've been reading Mike Migurski's excellent blog series [1](http://mike.teczno.com/notes/redistricting.html) and [2](http://mike.teczno.com/notes/redistricting/measuring-efficiency-gap.html), on US election data and redistricting and this repo is in repsonse to his call for better data.

For analysis to be rigorous, **geographic shape data** is needed at the precinct level, and **vote results** for local races like state house, state senate, and federal representative to the U.S. Congress is essential. They must be matched up per year, as precinct voting districts often change each election.

This repo is an effort to gather this essential data and distribute it as open data.

### Gathering data

Please browse the [issues](https://github.com/nvkelso/election-geodata/issues) attached to this Github repo to identify sources and import shapefiles for precincts. The goal is to have state-wide shapefiles for multiple dates corresponding to election years (like 2008, 2010, 2012, 2014, and 2016). Statewide is prefered, but county and city are also interesting.

If you also find election result information along the way my current thinking is it's better to contribute to the [Open Elections](https://github.com/openelections) project directly, but maybe it's easier to do that here and then link up over there later.

### Possible Sources:

- State elections officials (eg [secretary of state](http://www.nass.org/))
- Local (county) election officials (eg registrar of voters)
- [Open Elections](http://www.openelections.net/) – a [Github-based project](https://github.com/openelections) by journalists Serdar Tumgoren and Derek Willis
- Data hackers and data journalists, like [LA Times](https://github.com/datadesk/california-2016-election-precinct-maps)

### See also:

1. [baby steps towards measuring the efficiency gap](http://mike.teczno.com/notes/redistricting/measuring-efficiency-gap.html) - Mike's follow-up post
2. [things I’ve recently learned about legislative redistricting](http://mike.teczno.com/notes/redistricting.html) - Mike's original post
