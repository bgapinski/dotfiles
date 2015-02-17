{ pkgs ?
  ( import <nixpkgs> {} )}:
 with 
    pkgs.haskellPackages_ghc763;
    cabal.mkDerivation ( self: {
      pname = "xmonad-brian";
      version = "0.1";
      src = ".";
      buildInputs = [
        ghc xmonad
        xmonadExtras
        xmonadContrib
        xmobar X11
        lens pkgs.nix
      ];
  })
