{ self, inputs, ... }: {

  flake.nixosModules.bottles = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      bottles
    ];
  };
}
