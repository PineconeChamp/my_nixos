{ self, inputs, ... }: {
  flake.nixosModules.user = { pkgs, lib, ... }: let
    modules = with self.nixosModules; [];
  in {
    imports = modules;
    users.users."pine" = {
      isNormalUser = true;
      description = "pine";
      extraGroups = [
        "networkmanager"
        "wheel"
        "audio"
      ];
      packages = with pkgs; [];
    };
  };
}

