{
  #pkgs,
  ...
}:{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.paci = {
    isNormalUser = true;
    description = "Paci Stardust";
    extraGroups = [ "networkmanager" "wheel" ];
    #packages = with pkgs; [];
  };
}