
# OpenFOAM-related tap for [Homebrew](https://brew.sh)

## Available casks

### Native OpenFOAM for macOS

* `openfoam2112`: OpenFOAM-v2112.app (https://github.com/gerlero/openfoam2112-app)

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

These are variants and alternate versions of Homebrew formulae for better compatibility with OpenFOAM. They are installed automatically along with the `openfoam2112` cask.

* `cgal@4`: CGAL, major version 4

    ```bash
    brew install gerlero/openfoam/cgal@4
    ```

* `scotch-no-pthread`: Scotch libraries compiled without the `-DSCOTCH_PTHREAD` flag (thanks [@BrushXue](https://github.com/BrushXue))

    ```bash
    brew install gerlero/openfoam/scotch-no-pthread
    ```
