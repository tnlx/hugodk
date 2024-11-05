# hugodk

[Hugo](https://gohugo.io) docker image.

0.136.2, latest:
- Hugo 0.136.2
- Go 1.23.2

By default, upon starting, the container

- copies source code mounted at **/src** to **/workdir**.
- run custom entrypoint scripts in **/entrypoint.d/*.sh**.
- exec **hugo** with input commands.

```sh
docker run --rm \
        -v "${PWD}:/src" \
        -v "/tmp/web:/workdir/public" \
        tcvle/hugodk \
        --baseURL "https://..."
```