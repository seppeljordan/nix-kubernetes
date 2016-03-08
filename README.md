# nix-kubernetes [![NPM version][npm-image]][npm-url] [![Build Status][travis-image]][travis-url] [![Dependency Status][daviddm-image]][daviddm-url] [![Coverage percentage][coveralls-image]][coveralls-url]
> Kubernetes deployment manager written in nix

## Installation

```sh
$ npm install -g nix-kubernetes
```

## Usage

```bash
Usage: lib/cli.js <command> [options]

Commands:
  create <file>  Create deployment
  list           List all known deployments
  delete         Delete deployment
  describe       Describes deployment
  deploy         Deploy configuration

Options:
  -h, --help    Show help                                              [boolean]
  -c, --config                          [default: "~/.kube/nix-kubernetes.json"]

Examples:
  lib/cli.js create -d name deploy.nix    create deployment
  lib/cli.js deploy -d name               deploy resources
  lib/cli.js deploy -d name --build-only  only build
```

## Example usage

```sh
$ nix-kubernetes create -d gatehub deploy.nix
$ export NIX_PATH="services=/home/offlinehacker/projects/x-truder.net/services:$NIX_PATH"
$ nix-kubernetes deploy -d gatehub --build-only
$ nix-kubernetes deploy -d gatehub
```

## Development

### Use development version

```sh
$ npm link
$ export PATH=~/.npm/bin:$PATH
```

## Build deployments

```sh
$ nix-build -A staging --arg configuration deploy.nix
```

## License

MIT © [Jaka Hudoklin](https://x-truder.net)


[npm-image]: https://badge.fury.io/js/nix-kubernetes.svg
[npm-url]: https://npmjs.org/package/nix-kubernetes
[travis-image]: https://travis-ci.org/x-truder/nix-kubernetes.svg?branch=master
[travis-url]: https://travis-ci.org/x-truder/nix-kubernetes
[daviddm-image]: https://david-dm.org/x-truder/nix-kubernetes.svg?theme=shields.io
[daviddm-url]: https://david-dm.org/x-truder/nix-kubernetes
[coveralls-image]: https://coveralls.io/repos/x-truder/nix-kubernetes/badge.svg
[coveralls-url]: https://coveralls.io/r/x-truder/nix-kubernetes
