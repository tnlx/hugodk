# hugodk

[Hugo](https://gohugo.io) docker image.

0.136.2, latest:
- Hugo 0.136.2
- Go 1.23.2

```sh
docker run --rm -v "${PWD}:/src" -u "$(id -u):$(id -g)" tcvle:hugo:latest
```