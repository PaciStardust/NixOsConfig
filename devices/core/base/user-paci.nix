{
  #pkgs,
  ...
}:{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.paci = {
    isNormalUser = true;
    description = "Paci Stardust";
    extraGroups = [ "networkmanager" "wheel" "shareedit" ];
    #packages = with pkgs; [];
  };
}