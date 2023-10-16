# File sharing on Raspberry Pi

Adapted from [Filesharing with the Raspberry Pi](https://raspberrypi-guide.github.io/filesharing/filesharing-raspberry-pi.html).

## scp

```
scp <originfile> pi@<Raspberry Pi IP address>:<destinationfile>
```

## Samba

A more versatile solution that also enables you to mount (drives on) your Raspberry Pi is to use Samba.

1.  Install Samba:

    ```sh
    sudo apt install samba samba-common-bin
    ```

2.  Create a dedicated shared directory. Name and location are arbitrary.

    Make the folder readable and writeable for all users while preventing it from accidental deletion using `1777`:

    ```sh
    sudo mkdir -m 1777 /pimusic
    ```

3.  Edit the Samba configuration file:

    ```sh
    sudo nano /etc/samba/smb.conf
    ```

4.  Add the following configuration to share the folder, giving the remote user read/write permissions:

    ```
    [pimusic]
    comment = pimusic
    path = /pimusic
    browseable = yes
    writeable = yes
    create mask = 0777
    directory mask = 0777
    force create mode = 0777
    force directory mode = 0777
    guest ok = no
    ```

    Exit and save by entering `ctrl+x`, `y`.

5.  Set a Samba password for the user `pi`:

    ```sh
    sudo smbpasswd -a pi
    ```

6.  Restart the samba service for the changes to take effect:

    ```sh
    sudo systemctl restart smbd
    ```

    Samba will automatically start whenever you power on the Raspberry Pi.

## Connecting to the shared folder

### MacOS

1.  In Finder click `Go` > `Connect to server`
2.  Click `browse` to find the shared folder automatically, or you can directly enter the address in the address box: `smb://[ip-address]/[nameofshare]`.

### Windows

1.  In File Explorer click `Network` to view the Raspberry Pi.
2.  Click the device to see shared folders.
