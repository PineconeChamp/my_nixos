{ self, inputs, ... }: {
  flake.nixosModules.core = { pkgs, lib, ... }: let
    modules = with self.nixosModules; [
      boot
      locale
      bluetooth
      networking
      audio
      user
      nix
      flatpak
      otd
    ];
  in {
    imports =
      [
      ]
      ++ modules;
    services = {
      openssh.enable = true;
      avahi.enable = true;
    };
    environment.systemPackages = with pkgs; [
      vim
      unzip
      p7zip-rar
      usbutils
      lsof
      gvfs
      libnotify
      python315
      curlWithGnuTls
      wget
    ];
    system.stateVersion = "26.05";
  };
}

