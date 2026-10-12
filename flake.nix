{
  description = "Minimal datalab environment for TEI image analysis and DuckDB indexing";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        tools = with pkgs; [
          # Core workflow tools
          duckdb          # SQL engine for database
          xmlstarlet      # XML processing (TEI analysis)
          gzip            # Compression (TSV output)
          findutils       # `find` command for file discovery
          coreutils       # Basic file ops (mkdir, rm, etc.)
          gnumake         # For running the Makefile
          bash            # Shell for scripts
        ];
      in
      {
        packages.default = pkgs.buildEnv {
          name = "datalab";
          paths = tools;
        };

        devShells.default = pkgs.mkShell {
          packages = tools;
          shellHook = ''
            echo "Datalab Environment for TEI Image Analysis"
            echo "--------------------------------------------"
            echo "Available tools:"
            echo "  - duckdb: SQL database engine"
            echo "  - xmlstarlet: XML processing"
            echo "  - gzip: Compression"
            echo "  - find: File search"
            echo "  - make: Build tool"
            echo
            echo "Run 'make' to process your TEI corpus."
          '';
        };
      }
    );
}