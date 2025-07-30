{
  inputs = {
    nixpkgs.url     = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          pure = true;
          packages = with pkgs; [
            go
            gopls
            gotools
            cobra-cli
            golangci-lint
            go-junit-report
            delve
            git
          ];
        };
      });
}
