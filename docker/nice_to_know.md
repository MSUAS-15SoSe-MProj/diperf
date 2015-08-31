## Mac

Rebuild the VM after an upgrade with:

boot2docker destroy && boot2docker upgrade

To have launchd start boot2docker at login:

ln -sfv /usr/local/opt/boot2docker/*.plist ~/Library/LaunchAgents

Then to load boot2docker now:

launchctl load ~/Library/LaunchAgents/homebrew.mxcl.boot2docker.plist
