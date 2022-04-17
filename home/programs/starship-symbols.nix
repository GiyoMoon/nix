{ lib, ... }:
let
  inherit (lib) mkDefault;
in
{
  programs.starship.settings = {
    aws.symbol = mkDefault "  ";
    buf.symbol = mkDefault " ";
    conda.symbol = mkDefault " ";
    dart.symbol = mkDefault " ";
    directory.read_only = mkDefault " ";
    docker_context.symbol = mkDefault " ";
    elixir.symbol = mkDefault " ";
    elm.symbol = mkDefault " ";
    git_branch.symbol = mkDefault " ";
    golang.symbol = mkDefault " ";
    haskell.symbol = mkDefault " ";
    hg_branch.symbol = mkDefault " ";
    java.symbol = mkDefault " ";
    julia.symbol = mkDefault " ";
    memory_usage.symbol = mkDefault " ";
    nim.symbol = mkDefault " ";
    nix_shell.symbol = mkDefault " ";
    nodejs.symbol = mkDefault " ";
    package.symbol = mkDefault " ";
    rust.symbol = mkDefault " ";
  };
}