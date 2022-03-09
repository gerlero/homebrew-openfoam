
# OpenFOAM-related tap for [Homebrew](https://brew.sh)

## Available casks

* `openfoam2112`: **OpenFOAM-v2112.app** - Native OpenFOAM for macOS (https://github.com/gerlero/openfoam2112-app)

    ```bash
    brew install --no-quarantine gerlero/openfoam/openfoam2112
    ```
## Available formulae

These are variants and alternate versions of Homebrew formulae for better compatibility with OpenFOAM. They are installed automatically along with the `openfoam2112` cask.

* `cgal@4`: CGAL, major version 4

    ```bash
    brew install gerlero/openfoam/cgal@4
    ```

* `scotch-no-pthread`: Scotch libraries compiled without the `-DSCOTCH_PTHREAD` flag (thanks [@BrushXue](https://github.com/BrushXue))

    ```bash
    brew install gerlero/openfoam/scotch-no-pthread
    ```
