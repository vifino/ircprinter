# IRCPrinter

Something something lets print to irc because reasons.

# Install
``` bash
# Build
make

# Install
sudo make install

# Configure basics
# Set the PUUSH Token and change the format, if needed.
sudo $EDITOR /etc/default/ircprinter


# Add the printer.
# LPAdmin adds a printer here.
# -P: Sets the PPD for the printer
# -D: Description.
# -p: Printer name.
# -v: The DEVICE_URI, in this case, these are IRC Links. No password or something, but simple things like irc://user@server:port/#Channel work fine.
sudo lpadmin \
	-E \
	-P ppd/irc.ppd \
	-D "My IRC Printer." \
	-p MY-IRC-PRINTER \
	-v "irc://myprinter@mynetwork.lan:6667/#Printer"
```

# Usage

Just print some thing in postscript to the printer which you made in the installation.

Remember when I said there will never be support for multiple connections?

Yeah...

Well, it has now, thanks to irc uris.

Oh well, not being lazy isn't that hard after all.

I'm a bad liar.

# License
MIT
