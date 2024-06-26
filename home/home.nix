{ config, pkgs, lib, ... }:

{
  imports = [
    ./programs/.
  ];

  home.stateVersion = "23.05"; # Please read the comment before changing.

  # Secrets configuration goes here for file management convenience
  secrets = {
    # Absolute path to identity (created not through home-manager)
    identityPaths = [ "${config.home.homeDirectory}/.ssh/mersinvald" ];

    # Deployment directory for deployed secrets
    mount = "${config.xdg.configHome}/secrets";

    # Reload on rebuild
    enableForceReload = true;

    # mc-minio config
    file.mc-config-json = {
      source = ./secrets/mc-config-json.age;
      symlinks = [
        "${config.home.homeDirectory}/.config/mc/config.json"
      ];
    };

    # aws cli config
    file.aws-config = {
      source = ./secrets/aws-config.age;
      symlinks = [
        "${config.home.homeDirectory}/.aws/config"
      ];
    };
    file.aws-credentials = {
      source = ./secrets/aws-credentials.age;
      symlinks = [
        "${config.home.homeDirectory}/.aws/credentials"
      ];
    };

    # kubectl config
    file.kube-config = {
      source = ./secrets/kube-config.age;
      symlinks = [
        "${config.home.homeDirectory}/.kube/config"
      ];
    };
  };

  home.sessionVariables = {
    # SECRET_VALUE = ''
    #   $(${pkgs.coreutils}/bin/cat ${config.age.secrets.mc-config-json.path})
    # '';
  };
}
