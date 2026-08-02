{ self, inputs, ... }: {

  flake.nixosModules.audio-plugins = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      lsp-plugins
      vital
      helm
    ];

    # Force NixOS to expose the target directory contents to the system layer
    environment.pathsToLink = [
      "/lib/vst"
      "/lib/vst3"
      "/lib/lv2"
      "/lib/clap"
    ];

    # Use standard library formatting to map paths reliably
    environment.sessionVariables = {
      VST_PATH   = [ "/run/current-system/sw/lib/vst" "$HOME/.nix-profile/lib/vst" ];
      VST3_PATH  = [ "/run/current-system/sw/lib/vst3" "$HOME/.nix-profile/lib/vst3" ];
      LV2_PATH   = [ "/run/current-system/sw/lib/lv2" "$HOME/.nix-profile/lib/lv2" ];
      CLAP_PATH  = [ "/run/current-system/sw/lib/clap" "$HOME/.nix-profile/lib/clap" ];
    };
  };
}

