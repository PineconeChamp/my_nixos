{ self, inputs, ... }: {

  flake.nixosModules.defaultApps = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      vim
      wget
      git
      kitty
      tree
      kalker
      kdePackages.dolphin
      libreoffice
    ];
  };
}
