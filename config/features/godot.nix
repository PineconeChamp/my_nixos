{ self, inputs, ... }: {

  flake.nixosModules.godot = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      godot
    ];
  };
}
