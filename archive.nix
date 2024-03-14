{ stdenvNoCC, zip }:
stdenvNoCC.mkDerivation {
  name = "archive";
  src = ./.;
  buildInputs = [ zip ];
  dontPatch = true;
  dontBuild = true;
  configurePhase = ''
    runHook preConfigure

    rm -r LICENSE *.nix *.lock

    runHook postConfigure
  '';
  installPhase = ''
    runHook preInstall

    mkdir -p "$out"
    zip -r "$out/template.zip" .

    runHook postInstall
  '';
}
