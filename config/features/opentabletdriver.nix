{ self, inputs, ... }: {

  flake.nixosModules.opentabletdriver = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      opentabletdriver
    ];
  };
}
