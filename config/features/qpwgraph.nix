{ self, inputs, ... }: {

  flake.nixosModules.qpwgraph = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      qpwgraph
    ];
  };
}
