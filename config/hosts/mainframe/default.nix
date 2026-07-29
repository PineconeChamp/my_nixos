{ self, inputs, ...}: {
flake.nixosConfigurations.homeSys = inputs.nixpkgs.lib.nixosSystem {
modules = [self.nixosModules.homeSysConfiguration
];
};
}
