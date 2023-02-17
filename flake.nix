{
  description = "Pie!";

  inputs = {
    flakeUtils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self, nixpkgs, flakeUtils
  }: let
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
  in
    flakeUtils.lib.eachSystem supportedSystems (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = [
          pkgs.racket
        ];
      };
    });
}
