{ config, pkgs, vars, lib, ... }:

{
  # 基本設定
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # ローカライズ
  time.timeZone = "Asia/Tokyo";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-mozc ];
  };
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8";
    LC_TELEPHONE = "ja_JP.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };

  # システムパッケージ
  environment.systemPackages = with pkgs; [
    wezterm
  ] ++ (lib.optionals (pkgs.stdenv.hostPlatform.system == "x86_64-linux") [
    google-chrome
  ]);

  # デスクトップ環境 (GNOME)
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  
  stylix.targets.qt.platform = lib.mkForce "qtct";

  # サウンド (Pipewire)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # ユーザー設定
  users.users."${vars.username}" = {
    isNormalUser = true;
    description = vars.userfullname;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # アプリケーション
  programs.firefox.enable = true;

  # その他
  zramSwap.enable = true;
  services.printing.enable = true;
  networking.networkmanager.enable = true;
}
