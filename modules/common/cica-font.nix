{ pkgs }:

pkgs.stdenvNoCC.mkDerivation {
  pname = "cica";
  version = "5.0.3";

  src = pkgs.fetchzip {
    url = "https://github.com/miiton/Cica/releases/download/v5.0.3/Cica_v5.0.3.zip";
    hash = "sha256-BtDnfWCfD9NE8tcWSmk8ciiInsspNPTPmAdGzpg62SM=";
    stripRoot = false;
  };

  dontUnpack = true;

  installPhase = ''
    runHook preInstall
    install -Dm644 "$src"/*.ttf -t "$out/share/fonts/truetype/cica"
    runHook postInstall
  '';
}
