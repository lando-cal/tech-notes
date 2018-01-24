launchd is MacOS X's init system.

# Example

## Watch Folder

This user LaunchAgent would be placed into `$HOME/Library/LaunchAgents/photo_processor.plist`.

We have to specify `/bin/bash` as the first ProgramArgument so OS X doesn't complain about DRM or mach-o executable shizz. This effectively limits us to bash 3.

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>photo_processor.sh</string>

    <key>ProgramArguments</key><array>
      <string>/bin/bash</string>
      <string>/Users/hoherd/code/dho-bin/photo_processor.sh</string>
    </array>

    <key>WatchPaths</key>
    <array>
        <string>/Users/hoherd/Dropbox/yp/photo_queue/</string>
    </array>

  </dict>
</plist>
```

# See also

- <https://github.com/jordansissel/pleaserun>
