# GCC Cross-Compiler Toolchain Build Script

This repository contains the script needed to compile bare-metal GCC for
various architectures using Linux distributions. The GCC source is fetched from
the release branch hence, contains all the release branch changes.

## Before we start

This script only works on distros that use musl libc! (such as alpine)

### Required Packages
```sh
$ apk add gcc g++ texinfo make curl bash ninja bison flex git cmake clang lld mpfr-dev mpc1-dev llvm clang python3
```

## Usage

Running this script is quite simple. We start by cloning this repository:
`bash git clone https://github.com/KenHV/gcc-build.git gcc-build `
`bash ./build-gcc.sh -a <architechture> `

> As of now, I only support **arm**, **arm64** and **x86 (compiles for x86_64
> only)**. This list is subject to change as I receive requests.

> Keep in mind that this script contains just the bare minimum prerequisites.

## Credits

- [Vaisakh](https://github.com/mvaisakh/) for writing this script.
- [OS Dev Wiki](https://wiki.osdev.org) for knowledge base.
- [USBHost's Amazing GCC Build
  script](https://github.com/USBhost/build-tools-gcc) for certain prerequisite
  dependencies.

## Looking for precompiled toolchains?

My GCC cross-compiler builds are automated and pushed weekly i.e. on Sundays
at 00:00 GMT (05:30 IST). They are pushed to:

- **[ARM64](https://github.com/KenHV/gcc-arm64)**
- **[ARM32](https://github.com/KenHV/gcc-arm)**

## Contributing to this repo

You're more than welcome to improve the contents within this script with a pull
request. Enjoy :)
