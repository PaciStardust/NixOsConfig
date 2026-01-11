{
  pkgs,
  ...
}:{
  imports = [
    ./plasma-manager.nix
    ./sddm
  ];

  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    baloo
    baloo-widgets
  ];

  environment.systemPackages = with pkgs; [
    kdePackages.akregator
    kdePackages.aurorae
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.isoimagewriter
    kdePackages.kate
    kdePackages.kalk
    kdePackages.kcharselect
    kdePackages.kclock
    kdePackages.kcolorchooser
    kdePackages.kio-admin
    kdePackages.kolourpaint
    kdePackages.konsole
    kdePackages.korganizer
    kdePackages.krunner
    kdePackages.ksystemlog
    kdePackages.ktimer
    kdePackages.kwallet
    kdePackages.kwalletmanager
    kdePackages.partitionmanager
  ];
}