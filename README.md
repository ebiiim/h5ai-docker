# h5ai-docker

[![GitHub](https://img.shields.io/github/license/ebiiim/h5ai-docker)](https://github.com/ebiiim/h5ai-docker/blob/main/LICENSE)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/ebiiim/h5ai-docker)](https://github.com/ebiiim/h5ai-docker/releases/latest)
[![Release](https://github.com/ebiiim/h5ai-docker/actions/workflows/release.yaml/badge.svg)](https://github.com/ebiiim/h5ai-docker/actions/workflows/release.yaml)


Yet another Docker image for [lrsjng/h5ai](https://github.com/lrsjng/h5ai).

## Usage

> 💡 Please read [h5ai docs](https://larsjung.de/h5ai/) before using this image.

```sh
docker run --rm \
  -p 8080:80 \
  -v /path/to/dir1:/var/www/html/dir1:ro \
  -v /path/to/dir2:/var/www/html/dir2:ro \
  ... \
  ghcr.io/ebiiim/h5ai
```

**Using custom [`options.json`](https://github.com/lrsjng/h5ai/blob/master/src/_h5ai/private/conf/options.json)**

```diff
  docker run --rm \
    -p 8080:80 \
+   -v /path/to/options.json:/var/www/html/_h5ai/private/conf/options.json:ro \
    -v /path/to/dir1:/var/www/html/dir1:ro \
    -v /path/to/dir2:/var/www/html/dir2:ro \
    ... \
    ghcr.io/ebiiim/h5ai
```

**Using custom Apache config**

```diff
  docker run --rm \
    -p 8080:80 \
+   -v /path/to/h5ai.conf:/etc/apache2/conf-enabled/h5ai.conf:ro \
    -v /path/to/dir1:/var/www/html/dir1:ro \
    -v /path/to/dir2:/var/www/html/dir2:ro \
    ... \
    ghcr.io/ebiiim/h5ai
```

## Changelog

We use the same version as h5ai.

- 2023-04-21 v0.30.0
  - initial release
  - lrsjng/h5ai: [v0.30.0](https://github.com/lrsjng/h5ai/tree/aa94de4945e69ff742525cd4d648c91e5c9d8cd2) 2021-01-25
