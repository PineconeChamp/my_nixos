{ self, inputs, ... }: {

  flake.nixosModules.blender = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      blender
    ];
  };
}
