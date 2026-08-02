{ self, inputs, ... }: {

  flake.nixosModules.proton = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      protonup-ng
    ];
    
  };
}
