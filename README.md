# Minimal docker image to run xpra

This docker image provides remote access to X11 using [xpra](https://xpra.org/). This is a base image with minimal dependencies and can be used as basis for other images.

A container using the image can be started with:

```sh
docker run ffeldhaus/docker-xpra-minimal
```

Running the image will results in multiple warnings and error messages to be shown from xpra as xpra is trying to use a lot of recommended dependencies which are not included in this image. Also this image does not have a command such as `xterm` installed which can be run. Consider creating your own image based on this image where you can add the dependencies and programs you need.