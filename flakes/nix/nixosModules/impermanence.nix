{
  environment.persistence."/persist/xiaoxin" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/etc/v2raya"
      "/etc/NetworkManager/system-connections"
    ];
    files = [
      "/etc/machine-id"
    ];

    users.ethan = {
      directories = [
        "Downloads"
	"Pictures"
	"Documents"
	"Videos"
	"flakes"
	".config"
	".ssh"
      ];
    };
  };
}
