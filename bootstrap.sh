#!/bin/sh
echo "installing nix"
eval "$(curl -L https://nixos.org/nix/install)"

echo "copying keys"
mkdir -p /Users/yuna/Library/Application\ Support/sops/age/
cp secres/keys.txt /Users/yuna/Library/Application\ Support/sops/age/keys.txt

echo "enabling flakes"
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >>~/.config/nix/nix.conf

echo "configuring nix-darwin"
nix run nix-darwin -- switch --flake ~/.nix
