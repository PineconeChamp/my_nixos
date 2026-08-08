{ self, inputs, ... }: {
  flake.nixosModules.otd = { pkgs, lib, ... }: {
    hardware.opentabletdriver = {
      enable = true;
      blacklistedKernelModules = [ "wacom" "hid-uclogic" ];
    };

    hardware.uinput.enable = true;
    boot.kernelModules = [ "uinput" ];      
  };
}

