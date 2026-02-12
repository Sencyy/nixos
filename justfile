build-vm:
    NIXPKGS_ALLOW_INSECURE=1 nix-build '<nixpkgs/nixos>' -A vm -I nixpkgs=channel:nixos-25.11 -I nixos-config=./machines/testvm.nix --show-trace

run-vm:
    ./result/bin/run-nixos-vm -cpu host --enable-kvm -m 4G -smp 4  