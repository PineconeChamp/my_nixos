{ self, inputs, ... }: {

  flake.nixosModules.prismlauncher = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      prismlauncher
    ];
  };
}
