# docker-whosonfirst-internet-archive

## Important

This is not ready to use yet.

## Building

```
docker build -t whosonfirst-internet-archive .
```

## Running

This assumes that you have already created an Internet Archive config file (see below) and that you have put in a folder that can be mounted as [a Docker volume](https://docs.docker.com/storage/volumes/).

```
docker run \
	-v /YOUR/PATH/TO/docker-whosonfirst-internet-archive/config:/etc/internetarchive \
	whosonfirst-internet-archive \
	/usr/bin/wof-internet-archive -options REPO REPO REPO
```

## Setting your Internet Archive (`ia`) config file

_Please write me_

## See also

* https://archive.org/services/docs/api/internetarchive