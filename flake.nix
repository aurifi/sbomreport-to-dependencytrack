{
  description = "Development flake for sbomreport-to-dependency-track";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/eda8faa183a4be363849fe0ab566f35dd70d0d42";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      devShell = with pkgs;
        mkShell rec {
          buildInputs = [
            go_1_26
            golangci-lint
          ];
        };
    });
}
