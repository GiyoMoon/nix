{ lib, ... }:
let
  inherit (lib) mkDefault;
in
{
  programs.starship.settings = {
    directory.read_only = mkDefault " ";
    git_branch.symbol = mkDefault "";
    docker_context.symbol = mkDefault "";

    c.symbol = mkDefault "";
    dart.symbol = mkDefault "";
    elixir.symbol = mkDefault "";
    elm.symbol = mkDefault "";
    golang.symbol = mkDefault "";
    haskell.symbol = mkDefault "";
    java.symbol = mkDefault "";
    nodejs.symbol = mkDefault "";
    php.symbol = mkDefault "";
    rust.symbol = mkDefault "";

    nix_shell.symbol = mkDefault "";

    package.symbol = mkDefault "";
    # memory_usage.symbol = mkDefault "󰍛";
  };
}
