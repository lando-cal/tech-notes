`defaults` allows users to read, write, and delete Mac OS X user defaults from a command-line shell.

# Examples

## Add a value (an array) to a dict

```
FILENAME="${HOME}/Library/Preferences/com.googlecode.iterm2.plist"
defaults write ${FILENAME} "GlobalKeyMap" -dict-add "0xf703-0x280000" '{ Action = 10; Text = f; }'
defaults write ${FILENAME} "GlobalKeyMap" -dict-add "0xf702-0x280000" '{ Action = 10; Text = b; }'
```
