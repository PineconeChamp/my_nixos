{
  self,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.desktop = moduleWithSystem ({...}: let
    modules = with self.nixosModules; [
      core
      nvidia
    ];
  in {
    imports = modules;
  });
}

