# System Configuration

## Dock

Make the auto show/hide of the dock instant
```
// set the autohide timer to zero
defaults write com.apple.dock autohide-time-modifier -int 0

// set the autohide delay to zero
defaults write com.apple.Dock autohide-delay -float 0

// refresh the dock
killall Dock
```
