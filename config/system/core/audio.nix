{ self, inputs, ... }: {

  flake.nixosModules.audio = { pkgs, lib, ... }: {
    
    imports = [ inputs.musnix.nixosModules.musnix ];

    services.pulseaudio.enable = false; # Use Pipewire, the modern sound subsystem

    security.rtkit.enable = true; # Enable RealtimeKit for audio purposes
    
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    # Uncomment the following line if you want to use JACK applications
      jack.enable = true;
    };

    
    services.pipewire.extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 256;
        "default.clock.min-quantum" = 256;
        "default.clock.max-quantum" = 512;
      };
    };
    

    security.sudo.extraConfig = ''
    moritz  ALL=(ALL) NOPASSWD: ${pkgs.systemd}/bin/systemctl
    '';
    musnix = {
      enable = true;
      alsaSeq.enable = false;

      # Find this value with `lspci | grep -i audio` (per the musnix readme).
      # PITFALL: This is the id of the built-in soundcard.
      #   When I start using the external one, change it.
      soundcardPciId = "00:1f.3";

      # magic to me
      rtirq = {
        # highList = "snd_hrtimer";
        resetAll = 1;
        prioLow = 0;
        enable = true;
        nameList = "rtc0 snd";
      }; 
    };
    #postBootCommands = ''
    #  echo 2048 > /sys/class/rtc/rtc0/max_user_freq
    #  echo 2048 > /proc/sys/dev/hpet/max-user-freq
    #  setpci -v -d *:* latency_timer=b0
    #  setpci -v -s $00:1b.0 latency_timer=ff
    #'';
    # The SOUND_CARD_PCI_ID can be obtained like so:
    # $ lspci ¦ grep -i audio
    
    powerManagement.cpuFreqGovernor = "performance";
    
    security.pam.loginLimits = [
      { domain = "@audio"; item = "memlock"; type = "-"; value = "unlimited"; }
      { domain = "@audio"; item = "rtprio"; type = "-"; value = "99"; }
      { domain = "@audio"; item = "nofile"; type = "soft"; value = "99999"; }
      { domain = "@audio"; item = "nofile"; type = "hard"; value = "99999"; }
    ];

    services = {
      udev = {
        #packages = [ pkgs.ffado ]; # If you have a FireWire audio interface
        extraRules = ''
          KERNEL=="rtc0", GROUP="audio"
          KERNEL=="hpet", GROUP="audio"
        '';
      };
      cron.enable =false;
    };   
  };
}
