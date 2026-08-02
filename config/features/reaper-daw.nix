{ self, inputs, ... }: {

  flake.nixosModules.reaper = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      reaper
      reaper-sws-extension
      reaper-reapack-extension
      pipewire.jack
    ];
  };
}
