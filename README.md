# Docker APK Build Environment

An Alpine Linux environment for building APK packages using Docker.

See <http://wiki.alpinelinux.org/wiki/Creating_an_Alpine_package> for additional documentation and <https://engineering.fundingcircle.com/blog/2015/04/28/create-alpine-linux-repository/> for some background about testing and signing packages.

## Setup

To sign packages you’ll need a key pair. To generate a pair of keys for this purpose run:

```bash
# builds an image and starts a container
make build

# generate keys
sudo -u packager abuild-keygen -a -i
```

## Building a Package

Run `make build` to start the Docker environment. In the build environment, move into the package directory which contains an `APKBUILD` file and run the build.

```bash
cd /work/<package>

# Run the build
./build.sh <package>
```

The built packages will be in `./target` on the host.
