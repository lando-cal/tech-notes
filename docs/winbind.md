Title: winbind

These examples may only work on Samba 3. See info about Winbindd here: <https://wiki.samba.org/index.php/Configuring_Winbindd_on_a_Samba_AD_DC>

# Examples

## Ping the winbind servers

`wbinfo -p`

## list the domain users

`wbinfo -u`

## try authenticating the user against winbind

`wbinfo -a dhoherd`
