`defaults` is a BSD command to read and write configuration files.

# Examples

## Add a value (an array) to a dict

```
FILENAME="${HOME}/Library/Preferences/com.googlecode.iterm2.plist"
defaults write ${FILENAME} "GlobalKeyMap" -dict-add "0xf703-0x280000" '{ Action = 10; Text = f; }'
defaults write ${FILENAME} "GlobalKeyMap" -dict-add "0xf702-0x280000" '{ Action = 10; Text = b; }'
```
