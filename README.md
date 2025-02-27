
# OpenFOAM-related tap for Homebrew

This repository defines a [custom tap](https://docs.brew.sh/Taps) for [Homebrew](https://docs.brew.sh). It provides useful packages for running [OpenFOAM](https://www.openfoam.com) on macOS.

[![homebrew tap](https://img.shields.io/badge/homebrew%20tap-gerlero%2Fopenfoam-informational)](https://docs.brew.sh/Taps)

## Available casks

### OpenFOAM.app: Native OpenFOAM for macOS (https://github.com/gerlero/openfoam-app)

* `openfoam`: **OpenFOAM.app** (latest OpenFOAM version—currently v2406)

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam
    ```

* `openfoam@2406`: **OpenFOAM-v2406.app**

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam@2406
    ```

* `openfoam@2312`: **OpenFOAM-v2312.app**

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam@2312
    ```

* `openfoam@2306`: **OpenFOAM-v2306.app** (discontinued)

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam@2306
    ```

* `openfoam@2212`: **OpenFOAM-v2212.app** (discontinued)

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam@2212
    ```

* `openfoam@2206`: **OpenFOAM-v2206.app** (discontinued)

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam@2206
    ```

* `openfoam@2112`: **OpenFOAM-v2112.app** (discontinued)

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam@2112
    ```

## Available formulae

* `styro`: a community package manager for OpenFOAM (https://github.com/gerlero/styro)

    ```bash
    brew install gerlero/openfoam/styro
    ```

* `openfoam-docker`: run script for the official OpenFOAM container images (https://develop.openfoam.com/Development/openfoam/-/wikis/precompiled/docker)

    ```bash
    brew install gerlero/openfoam/openfoam-docker
    ```
