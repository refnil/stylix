{ pkgs, config, lib, ... }:

let
  theme = config.lib.stylix.colors {
    templateRepo = pkgs.fetchFromGitHub {
        owner = "refnil";
        repo = "base16-tmux";
        rev = "f954509b7ea43c2f34c19d505abed2d29030ae0a";
        sha256 = "sha256-JefVq2qcKcqKLd8Bpq9TAFUwr/Jx6rdD/PpI3fM5iXo=";
    };
  };

in {
  options.stylix.targets.tmux.enable =
    config.lib.stylix.mkEnableTarget "Tmux" config.programs.tmux.enable;

  config = lib.mkIf config.stylix.targets.tmux.enable {
    programs.tmux.extraConfig = ''
    source-file ${theme}
    '';
  };
}
