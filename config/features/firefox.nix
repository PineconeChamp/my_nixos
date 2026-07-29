{ self, inputs, ... }: {

  flake.nixosModules.firefox = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      firefox
    ];
  };
}
