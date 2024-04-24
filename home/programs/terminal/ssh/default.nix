{
  config,
  lib,
  flake-inputs,
  ...
}: {
  config = {
    programs.ssh = {
      enable = true;
      matchBlocks = {
        "*" = {
          identitiesOnly = true;
          identityFile = "~/.ssh/mersinvald";
        };

        "ansible" = {
          hostname = "192.168.88.13";
          user = "ansible";
        };

        "mikrotik" = {
          hostname = "172.18.1.1";
          user = "root";
          port = 22;
          extraOptions = {
            PubkeyAcceptedKeyTypes = "+ssh-rsa";
          };
        };

        "dsrc-jump" = {
          hostname = "172.31.108.127";
          user = "jump";
          port = 15890;
        };

        "dsrc-ansible" = {
          hostname = "172.31.108.127";
          user = "ansible";
          port = 15890;
        };

        "dsrc-minio" = {
          hostname = "172.30.1.66";
          user = "root";
          proxyJump = "dsrc-jump";
        };

        "dsrc-gitlab" = {
          hostname = "172.30.1.2";
          user = "root";
          proxyJump = "dsrc-jump";
        };

        "dsrc-gitlab-runner" = {
          hostname = "172.30.1.34";
          user = "ansible";
          proxyJump = "dsrc-jump";
        };

        "dsrc-mlflow" = {
          hostname = "172.30.1.130";
          user = "ansible";
          proxyJump = "dsrc-jump";
        };

        "dsrc-sanjay-0" = {
          hostname = "172.31.108.202";
          user = "root";
          proxyJump = "dsrc-jump";
        };

        "dsrc-sanjay-1" = {
          hostname = "192.168.30.41";
          user = "root";
          proxyJump = "dsrc-jump";
        };

        "dsrc-rack0-switch0" = {
          hostname = "172.31.108.127";
          user = "mkl+t";
          extraOptions = {
            PubkeyAcceptedKeyTypes = "+ssh-rsa";
          };
        };

        "dsrc-fusebmc-testbed" = {
          hostname = "10.100.0.2";
          user = "ansible";
          proxyJump = "dsrc-jump";
        };

        "dsrc-miso0" = {
          hostname = "192.168.30.100";
          user = "root";
          proxyJump = "dsrc-jump";
        };

        "dsrc-k8s-master" = {
          hostname = "10.8.0.10";
          user = "root";
          proxyJump = "dsrc-jump";
        };

        "dsrc-k8s-node0" = {
          hostname = "10.8.1.10";
          user = "root";
          proxyJump = "dsrc-jump";
        };

        "dsrc-k8s-node1" = {
          hostname = "10.8.1.11";
          user = "root";
          proxyJump = "dsrc-jump";
        };

        "dsrc-k8s-staging" = {
          hostname = "10.181.85.91";
          user = "root";
        };

        "dsrc-k8s-staging-gp" = {
          hostname = "10.161.136.1";
          user = "root";
        };

        "dsrc-gpuvm-mkl" = {
          hostname = "172.31.108.223";
          user = "mkl";
          proxyJump = "dsrc-jump";
        };
      };
    };
  };
}
