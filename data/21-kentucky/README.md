# Kentucky

Data is available for 2016 sourced from KY Board of Elections April 2016, [via the data.civicdataalliance.org](http://data.civicdataalliance.org/en/dataset/ky-voting-precinct-geographic-outlines/resource/18e47ffd-cfb1-40a8-8029-4e262ad1ada5):

- http://data.civicdataalliance.org/dataset/667f02ea-5b83-4399-a269-52bb024e2255/resource/18e47ffd-cfb1-40a8-8029-4e262ad1ada5/download/kyprecinctsmergedfinal.zip

NOTE: After reports about the resulting "nation" file only showed Kentucky (but manually zooming to the correct WGS 84 extent showed all states), research showed the kyprecinctsmergedfinal.zip had 2 copies of Kentucky, one apparently in WGS84 and the other in KY state plane projection. The `_mod` version has only the WGS84 content and is used in this composition.