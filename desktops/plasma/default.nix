{
  pkgs,
  ...
}:{
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.settings.General.DisplayServer = "wayland";
  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    spectacle
  ];

  environment.systemPackages = with pkgs; [
    kdePackages.akregator
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
    kdePackages.ksystemlog
    kdePackages.ktimer
    kdePackages.kwallet
    kdePackages.kwalletmanager
    kdePackages.partitionmanager
  ];
}