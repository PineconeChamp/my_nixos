{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    # Low latency kernal modules for music
    musnix.url = "github:musnix/musnix";
    
    # Nixify flatpak installs
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs = inputs: 
	inputs.flake-parts.lib.mkFlake {inherit inputs;} 
	(inputs.import-tree ./config);
}
