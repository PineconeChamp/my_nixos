{ self, inputs, ... }: {
  flake.nixosModules.nix = { pkgs, lib, ... }: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;
    security.polkit.enable = true;
    xdg.mime.defaultApplications = {
      "inode/directory" = [ "org.kde.dolphin.desktop" ];
    };
    services.dbus.enable = true;

    hardware.opentabletdriver.enable = true;
    hardware.uinput.enable = true;
    boot.kernelModules = [ "uinput" ];
  };
}

