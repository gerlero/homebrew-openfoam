
# OpenFOAM-related tap for Homebrew

This repository defines a [custom tap](https://docs.brew.sh/Taps) for [Homebrew](https://docs.brew.sh). It provides useful packages for running [OpenFOAM](https://www.openfoam.com) on macOS.

[![homebrew tap](https://img.shields.io/badge/homebrew%20tap-gerlero%2Fopenfoam-informational)](https://docs.brew.sh/Taps)

## Available casks

### OpenFOAM.app: Native OpenFOAM for macOS (https://github.com/gerlero/openfoam-app)

* `openfoam2212`: OpenFOAM-v2212.app 

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam2212
    ```

* `openfoam2206`: OpenFOAM-v2206.app 

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam2206
    ```

* `openfoam2112`: OpenFOAM-v2112.app

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam2112
    ```

## Available formulae

### Linux-based OpenFOAM in a container

* `openfoam-docker`: run script for the official OpenFOAM container images (https://develop.openfoam.com/packaging/containers)
        
    ```bash
    brew install gerlero/openfoam/openfoam-docker
    ```

* `openfoam-docker-arm`: run script for ARM-based OpenFOAM container images (https://github.com/gerlero/openfoam-docker-arm)
    
    ```bash
    brew install gerlero/openfoam/openfoam-docker-arm
    ```

### Dependencies for native OpenFOAM builds

These are variants and alternate versions of Homebrew formulae for better compatibility with OpenFOAM. You may want these if you're compiling OpenFOAM from source on macOS.

* `cgal@4`: CGAL, major version 4

    ```bash
    brew install gerlero/openfoam/cgal@4
    ```

* `scotch-no-pthread`: Scotch libraries compiled without the `-DSCOTCH_PTHREAD` flag (thanks [@BrushXue](https://github.com/BrushXue))

    ```bash
    brew install gerlero/openfoam/scotch-no-pthread
    ```
