{
  description = "The only NixOS config i will ever need.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    external = {
        elysia = {
          url = "git+https://dawn.wine/foxtrottt/elysia-on-nix";
          inputs.nixpkgs.follows = "nixpkgs";
        };
    };
  };

  outputs = { self, nixpkgs , external ...}: {

    nixosConfigurations = {
      testvm = import ./machines/testvm.nix { inherit nixpkgs external; };
      kompewtah = import ./machines/kompewtah.nix { inherit nixpkgs external; };
    };

  };
}
