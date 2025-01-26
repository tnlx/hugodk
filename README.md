# hugodk

Hugodk is a personalized [Hugo](https://gohugo.io) docker image.

## Versions

The image tags follow Hugo release versions.

|Tags|Libs|
|-|-|
|0.136.2|Go 1.23.2 + Hugo 0.136.2|
|0.142.0|Go 1.23.5 + Hugo 0.142.0 + DartSass 1.83.4|

## Usage

By default, upon starting, hugodk

- copies source code mounted at `/src` to `/workdir`.
- runs custom entrypoint scripts in `/entrypoint.d/*.sh`.
- runs `hugo`.

```sh
docker run --rm \
        # Provides the read-only source code in /src
        # and obtain outputs in /workdir
        -v ${PWD}:/src:ro \
        -v /tmp/web:/workdir/public \
        # custom entrypoint shell scripts
        -v /scripts:/entrypoint.d \
        tcvle/hugodk \
        # Other hugo cli options
        --baseURL "https://..."
```
