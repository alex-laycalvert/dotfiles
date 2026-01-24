# dotfiles

## post installation

### SDDM Theme

Copy the SDDM theme to the system themes directory:

```fish
sudo cp -r .config/sddm-astronaut-theme /usr/share/sddm/themes/
```

Ensure SDDM is setup to point at the theme

```/etc/sddm.conf
[Theme]
    Current=sddm-astronaut-theme
```

