# nix-kubernetes [![NPM version][npm-image]][npm-url] [![Build Status][travis-image]][travis-url] [![Dependency Status][daviddm-image]][daviddm-url] [![Coverage percentage][coveralls-image]][coveralls-url]
> Kubernetes deployment manager written in nix

## Installation

```sh
$ npm install -g nix-kubernetes
```

## Usage

```bash
Usage: /home/offlinehacker/.npm/bin/nix-kubernetes <command> [options]

Commands:
  create <file>   Create deployment
  list            List all known deployments
  delete          Delete deployment
  describe        Describes deployment
  deploy          Deploy configuration
  run-job <name>  Run distributed kubernetes job

Options:
  -c, --config  path to configuration file
                                        [default: "~/.kube/nix-kubernetes.json"]
  -h, --help    Show help                                              [boolean]

Examples:
  /home/offlinehacker/.npm/bin/nix-kuberne  create deployment
  tes create -d name deploy.nix
  /home/offlinehacker/.npm/bin/nix-kuberne  deploy resources
  tes deploy -d name -n namespace
  /home/offlinehacker/.npm/bin/nix-kuberne  only build
  tes deploy -d name --build-only
```

## Example usage

```sh
$ nix-kubernetes create -d gatehub deploy.nix
$ export NIX_PATH="services=/home/offlinehacker/projects/x-truder.net/services:$NIX_PATH"
$ nix-kubernetes deploy -d gatehub --build-only
$ nix-kubernetes deploy -d gatehub -n namespace
```

## Example deployment configurations

look into examples folder with example deployment configurations. 

## Options

For a list of all options look into [options.md](options.md)

## Nix-kubernetes services

Repo with bundle of nix-kubernetes
services is avalible on [https://github.com/x-truder/services](https://github.com/x-truder/services).

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
