# GeoTux GIS Server

[![Docker Pulls](https://img.shields.io/docker/pulls/yjacolin/mapcache.svg)](https://hub.docker.com/r/samtux/geotuxserver/)

[![Travis](https://travis-ci.org/yjacolin/docker-mapcache.svg)](https://travis-ci.org/samtux/docker-geotuxserver)

GeoTux GIS Server in Ubuntu Xenial with Mapserver, Mapcache, QGIS Server, Tileserver-PHP and Web Map Clients. 


![GeoTux GIS Server](https://i.imgur.com/hnSYgOF.png)

Server applications:

- Mapserver version 7.0.0
- Mapcache version 1.6.0
- QGIS Server 2.18.12
- Tileserver-PHP
- pycsw 2.0.3

Web client applications:

- MapStore2
- QGIS Web Client
- TerriaJS Map
- Lizmap Web Client

## Install
```
$ git clone https://github.com/GeoTux2/docker-geotuxserver.git
$ docker build -t samtux/geotuxserver .
```

## Run

```
$ docker run -d -p 8280:80 -p 8281:3001 -p 8282:3002 -v "gisdata":/gisdata --name geotuxserver samtux/geotuxserver
```

## Documentation

Explore the documentation in http://localhost:8280
