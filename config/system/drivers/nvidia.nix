{ self, ... }: {

  flake.nixosModules.nvidia = { pkgs, lib, config, ... }: {
    hardware.opengl = {
      enable = true;
      driSupport32Bit = true;
    };
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      modesetting.enable = true;

      open = false;
      
    };
  };
}
