{ self, inputs, ... }: {

  flake.nixosModules.steam = { pkgs, lib, ... }: {
    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;

    environment.systemPackages = with pkgs; [
      mangohud
    ];
    
    programs.gamemode.enable = true;
  };
}
