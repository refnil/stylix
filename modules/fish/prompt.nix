{ pkgs, config }:

let
  theme = config.lib.stylix.colors {
    templateRepo = config.lib.stylix.templates.base16-fish;
  };
in ''
  # https://github.com/tomyun/base16-fish/issues/7
  if status --is-interactive && test -z "$TMUX"
    source ${theme}
    base16-${config.lib.stylix.colors.slug}
  end
''
