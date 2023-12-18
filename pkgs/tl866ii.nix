{ mkWindowsApp
, wine
, unar
, pkgsi686Linux
, makeWrapper
, runCommand
, fetchgit
, TL866
}:
let
  # optimisation as opposed to using `npins` sources, since the repo is painfully large
  XGecu = fetchgit {
    url = "https://github.com/Kreeblah/XGecu_Software";
    rev = "f3c6c23ccc48ea16985d0fc82033c12bd018aea3";
    deepClone = false;
    sparseCheckout = [
      "Xgpro/12"
    ];
    hash = "sha256-pJ50Vu6QUQqO06SmWNgUbxLVZzo39/GyOVmgiHe1otk=";
  };
  Xgpro = runCommand "XgproV1260" { } ''
    mkdir -p $out
    ${unar}/bin/unar ${XGecu}/Xgpro/12/xgproV1260_setup.rar -o $out
  '';
in
mkWindowsApp rec {
  pname = "tl866ii";
  version = "1260";
  inherit wine;
  src = "${Xgpro}";
  winAppInstall = ''
    wine ${src}/XgproV1260_Setup.exe /S /DC:\\Xgpro
    cp ${TL866}/wine/setupapi.dll $WINEPREFIX/drive_c/windows/system32/
  '';
  winAppRun = with pkgsi686Linux; ''
    export LD_LIBRARY_PATH=${systemd}/lib:${libusb}/lib
    wine "$WINEPREFIX/drive_c/Xgpro/Xgpro.exe" "$ARGS"
  '';
  installPhase = ''
    runHook preInstall
    ln -s $out/bin/.launcher $out/bin/xgpro
    runHook postInstall
  '';
}
