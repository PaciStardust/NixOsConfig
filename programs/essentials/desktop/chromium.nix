{
  pkgs,
  ...
}:{
  environment.systemPackages = [
    # From https://github.com/hyblocker/nixfiles/blob/master/apps/browsers.nix
    (pkgs.chromium.override {
      enableWideVine = true;
      commandLineArgs = [
        "--disable-features=ExtensionManifestV2Unsupported,ExtensionManifestV2Disabled"
        "--disable-features=GlobalShortcutsPortal"
        "--password-store=gnome-libsecret"
      ];
    })
  ];

  programs.chromium = {
    enable = true;

    extraOpts = {
      "AIModeSettings" = 1;
      "GeminiSettings" = 1;
      "BrowserSignin" = 0;
      "SearchSuggestEnabled" = false;
      "UrlKeyedAnonymizedDataCollectionEnabled" = false;
      "SyncDisabled" = true;
      "PasswordManagerEnabled" = false;
      "SpellcheckEnabled" = true;
      "SpellcheckLanguage" = [
        "en-GB"
      ];
      "HomePageLocation" = "https://kagi.com";
      "NewTabPageLocation" = "https://kagi.com";
    };

    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # ublock origin lite
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
      "cdglnehniifkbagbbombnjghhcihifij" # kagi
      "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # privacy badger
    ];
  };
}