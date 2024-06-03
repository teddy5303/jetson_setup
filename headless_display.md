## Connect jetson without using a monitor

1. install xserver-xorg-video-dummy:
   
   ```bash
   sudo apt install xserver-xorg-video-dummy -y
   ```

2. change /etc/X11/xorg.conf as follows:
   
   ```ini
   Section "Module"
   Section "Device"
      Identifier  "Configured Video Device"
      Driver      "dummy"
   EndSection
   
   Section "Monitor"
     Identifier "Configured Monitor"
     HorizSync 31.5-48.5
     VertRefresh 50-70 
   EndSection
   
   Section "Screen"
     Identifier    "Default Screen"
     Monitor        "Configured Monitor"
     Device        "Configured Video Device"
     DefaultDepth 24
     SubSection "Display"
         Depth    24
         Modes "1280x720"
     EndSubSection
   EndSection
   ```

3. install seahorse
   
   ```bash
   sudo apt install seahorse -y
   seahorse
   ```

4. right click 'Login' and change password to empty

5. Settings->Sharing->Remote Desktop enable->set password

6. reboot, test on both VNC and RDP
   
   ```bash
   sudo reboot
   ```

##### default xorg.conf for backup

```ini
# Copyright (c) 2011-2013 NVIDIA CORPORATION.  All Rights Reserved.

#
# This is the minimal configuration necessary to use the Tegra driver.
# Please refer to the xorg.conf man page for more configuration
# options provided by the X server, including display-related options
# provided by RandR 1.2 and higher.

# Disable extensions not useful on Tegra.
Section "Module"
    Disable     "dri"
    SubSection  "extmod"
        Option  "omit xfree86-dga"
    EndSubSection
EndSection

Section "Device"
    Identifier  "Tegra0"
    Driver      "nvidia"
# Allow X server to be started even if no display devices are connected.
    Option      "AllowEmptyInitialConfiguration" "true"
EndSection
```

## Contributing

- [Jetson Orin No monitor, VNC only splash screen until monitor connected - #6，来自 Brian.He - Jetson AGX Orin - NVIDIA Developer Forums](https://forums.developer.nvidia.com/t/jetson-orin-no-monitor-vnc-only-splash-screen-until-monitor-connected/220642/6)
