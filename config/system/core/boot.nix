{ self, inputs, ... }: {
  
  flake.nixosModules.boot = { pkgs, lib, ... }: {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    zramSwap = {
      enable = true;
      algorithm = "zstd";
      memoryPercent = 10;
    };
  };
}
