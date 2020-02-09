# HYDRA

<img src="https://www.supinfo.com/articles/resources/160810/6336/0.png" width="200" height="200"/>


## INDEX

  - [HYDRA](#hydra)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
  - [LICENSE](#license)

## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/hydra/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/hydra/commits/master)

## INTRODUCTION

Docker image of :

- [hydra](https://github.com/vanhauser-thc/thc-hydra)

Continuous integration on :

- [gitlab](https://gitlab.com/oda-alexandre/hydra/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/hydra)

## PREREQUISITES

Use [docker](https://www.docker.com)

## INSTALL

```docker run -d --rm --name hydra -v ${HOME}:/home/hydra -v /tmp/.X11-unix/:/tmp/.X11-unix/ -e DISPLAY alexandreoda/hydra```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/hydra/blob/master/LICENSE)
