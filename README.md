# dotfiles-nix-core

Reusable [Home Manager](https://github.com/nix-community/home-manager) modules for my own use.

This repository is a flake that exposes helpers for building `homeConfigurations` from host definitions. It is meant to be referenced from other flake-based configuration repositories.

## Usage

In the repository that contains `hosts/`, create `flake.nix` as follows to add this repository as a flake input and generate `homeConfigurations`.

```nix
{
  inputs.dotfiles-core.url = "github:nyuyuyu/dotfiles-nix-core";

  outputs = { dotfiles-core, ... }: {
    homeConfigurations = dotfiles-core.lib.mkHomeConfigurations ./hosts;
    formatter = dotfiles-core.formatter;
  };
}
```

Each entry under `hosts/<hostname>/default.nix` defines one host.

```nix
{ hmDotfiles, ... }:

let
  user = "username";
in
{
  system = "x86_64-linux";
  username = user;

  module = {
    home.username = user;
    home.homeDirectory = "/home/${user}";
    home.stateVersion = "25.11";

    imports = [
      (hmDotfiles "fish")
    ];
  };
}
```

Modules are located under `modules/home-manager/` and can be referenced via `hmDotfiles "<name>"`.
