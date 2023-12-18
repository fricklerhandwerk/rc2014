{
  sources ? import ./npins,
  system ? builtins.currentSystem,
}:
let
  pkgs = import sources.nixpkgs {
    inherit system;
    config = {};
    overlays = [];
  };

  mkWindowsApp = pkgs.callPackage "${sources.erosanix}/pkgs/mkwindowsapp" {
    inherit (pkgs.lib) makeBinPath;
  };
  tl866 = pkgs.callPackage ./pkgs/tl866ii.nix {
    inherit (sources) TL866;
    inherit mkWindowsApp;
  };
in
{
  shell = pkgs.mkShell {
    packages = with pkgs; [
      npins
      tio
      tl866
    ];
  };
}
