
# OpenFOAM-related tap for Homebrew

This repository defines a [custom tap](https://docs.brew.sh/Taps) for [Homebrew](https://docs.brew.sh). It provides useful packages for running [OpenFOAM](https://www.openfoam.com) on macOS.

[![homebrew tap](https://img.shields.io/badge/homebrew%20tap-gerlero%2Fopenfoam-informational)](https://docs.brew.sh/Taps)

## Available casks

### OpenFOAM.app: Native OpenFOAM for macOS (https://github.com/gerlero/openfoam-app)

* `openfoam`: **OpenFOAM.app** (latest OpenFOAM version—currently v2312)

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam
    ```

* `openfoam2312`: **OpenFOAM-v2312.app**

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam2312
    ```

* `openfoam2306`: **OpenFOAM-v2306.app**

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam2306
    ```

* `openfoam2212`: **OpenFOAM-v2212.app** (discontinued)

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam2212
    ```

* `openfoam2206`: **OpenFOAM-v2206.app** (discontinued)

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam2206
    ```

* `openfoam2112`: **OpenFOAM-v2112.app** (discontinued)

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam2112
    ```

## Available formulae

### Linux-based OpenFOAM in a container

* `openfoam-docker`: run script for the official OpenFOAM container images (https://develop.openfoam.com/Development/openfoam/-/wikis/precompiled/docker)

    ```bash
    brew install gerlero/openfoam/openfoam-docker
    ```

* `openfoam-docker-arm`: run script for ARM-based OpenFOAM container images (https://github.com/gerlero/openfoam-docker-arm) (deprecated—prefer `openfoam-docker` instead)
    
    ```bash
    brew install gerlero/openfoam/openfoam-docker-arm
    ```

### Dependencies for native OpenFOAM builds

These are variants and alternate versions of Homebrew formulae for better compatibility with OpenFOAM. You may want these if you're compiling OpenFOAM from source on macOS.

* `scotch-no-pthread`: Scotch libraries compiled without the `-DSCOTCH_PTHREAD` flag (deprecated—prefer the official [`scotch`](https://formulae.brew.sh/formula/scotch) formula instead)

    ```bash
    brew install gerlero/openfoam/scotch-no-pthread
    ```

* `cgal@4`: CGAL, major version 4 (deprecated—prefer the official [`cgal`](https://formulae.brew.sh/formula/cgal) formula instead)

    ```bash
    brew install gerlero/openfoam/cgal@4
    ```
