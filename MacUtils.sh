# Tips
# For boolean values, yes=true, no=false ?

# show/hide .* files {{{
# unhide
#defaults write com.apple.finder AppleShowAllFiles true;killall Finder
# hide
#defaults delete com.apple.finder AppleShowAllFiles;killall Finder # default
# }}}

# show/hide file extensions {{{
# show
defaults write NSGlocalDomain AppleShowAllExtensions -bool true
# hide
#defaults write NSGlocalDomain AppleShowAllExtensions -bool true # default
# }}}

# Reduce transparency {{{
defaults write "com.apple.universalaccess" "reduceTransparency" -bool true
# }}}

# Disable Desktop function {{{
# disable
#defaults write com.apple.finder CreateDesktop -bool true;killall Finder

# enable
#defaults delete com.apple.finder CreateDesktop;killall Finder # default
# }}}

# move to previous desktop space by 4 finger double tap {{{
# enable
#defaults write com.apple.dock double-tap-jump-back -bool true;killall Dock # default
# disable
#defaults delete com.apple.dock double-tap-jump-back -bool true;killall Dock
# }}}

# Immutable Dock size {{{
# enable
#defaults write com.apple.dock size-immutable -bool true;killall Dock # default
# disable
#defaults delete com.apple.dock size-immutable;killall Dock
# }}}

# path bar in Finder starts from home directory {{{
# enable
#defaults write com.apple.finder PathBarRootAtHome -bool true;killall Finder # default
# disable
defaults delete com.apple.finder PathBarRootAtHome -bool true;killall Finder
# }}}

# enlarge window size for mission control, when scroll up mouse, or swipe up with two fingers {{{
# enable
defaults write com.apple.dock expose-cluster-scale -float 1;killall Dock
# disable
#defaults delete com.apple.dock expose-cluster-scale -float 0;killall Dock # default
# }}}

# Show windows when scroll up on an icon on the dock {{{
# enable
defaults write com.apple.dock scroll-to-open -bool true;killall Dock
# disable
#defaults delete com.apple.dock scroll-to-open;killall Dock # default
#}}}

# Show scroll bar (WhenScrolling, Automatic, Always) {{{
defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"
#}}}

# Set sidebar icon size: {{{
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2
#}}}


## 2D/3D dock # Doesn't work at Mavericks{{{
## 2D
#defaults write com.apple.dock no-glass -bool true;killall Dock
## 3D (glass effect)
##defaults delete com.apple.dock no-glass;killall Dock # default
##}}}

# transparent background {{{
# Make it transparent
defaults write com.apple.dock hide-mirror -bool true;killall Dock
# Reverse
#defaults delete com.apple.dock hide-mirror;killall Dock # default
#}}}

# Show/Hide dock immediately
# Make it transparent
#defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
# Reverse
#defaults delete com.apple.dock autohidetime-modifier;killall Dock
#}}}

# disable to make MacOS catalogue file (.DS_Store) {{{
# disable
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# enable
#defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true # default
# }}}

# show full path in title bar {{{
# enable
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true;killall Finder
# disable
#defaults delete com.apple.inder _FXShowPosixPathInTitle -bool true;killall Finder # default
# }}}

# show Libary{{{
# show
chflags nohidden ~/Library/
# hide
#chflags hidden ~/Library/ # default
# }}}

# XRayFolder (not valid for lion...) {{{
# enable
#defaults write com.apple.Finder QLEnableXRayFolders -bool true;killall Finder
# disable
#defaults delete com.apple.Finder QLEnableXRayFolders -bool true;killall Finder # default
# }}}

# Enable copy in quick look {{{
# enable
defaults write com.apple.finder QLEnableTextSelection -bool true; killall Finder
# disable
#defaults delete com.apple.finder QLEnableTextSelection -bool true; killall Finder # default
# }}}

# Stop Quick Look when move to other application {{{
# Stop
defaults write com.apple.finder QLHidePanelOnDeactivate -bool true
# Continue to show (default)
#defaults delete com.apple.finder QLHidePanelOnDeactivate # default
# }}}

# disable dashboard {{{
# disable
defaults write com.apple.dashboard mcx-disabled -bool true;killall Dock
# enable
#defaults delete com.apple.dashboard mcx-disabled -bool true;killall Dock
# }}}

# remove shadow from screen shot {{{
# remove
defaults write com.apple.screencapture disable-shadow -bool true;killall SystemUIServer
# add shadow
#defaults delete com.apple.screencapture disable-shadow;killall SystemUIServer # default
# }}}

# Set type of screen capture {{{
# set to jpg
defaults write com.apple.screencapture type jpg;killall SystemUIServer
# set to default (png)
#defaults delete com.apple.screencapture type;killall SystemUIServer
# }}}

# Set screen shot prefix {{{
# need at least 1 character (otherwise no SS is created!)
defaults write com.apple.screencapture name "ss";killall SystemUIServer
# set to default 
#defaults delete com.apple.screencapture name;killall SystemUIServer
# }}}

# Set screen shot name with date or not {{{
# Add date # default is true, but name change overwrites it as false...?
# If `defaults read com.apple.screencapture include-date` shows 0,
# need to re-enable it if necessary.
defaults write com.apple.screencapture include-date -bool true;killall SystemUIServer
# set to default (this is also same as include-date = true)...
#defaults delete com.apple.screencapture include-date;killall SystemUIServer
# }}}

# Set screen shot store directory {{{
defaults write com.apple.screencapture location "~/Downloads/"
# set to default (Desktop)
#defaults delete com.apple.screencapture location
# }}}


# Mail address copy in Mail.app {{{
# Remove alias (name) and copy only mail address
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool true
# Copy both alias (name) and mail address (default)
#defaults delete com.apple.mail AddressesIncludeNameOnPasteboard -bool true # default
# }}}

# Change Language for Application{{{
# Change to English for Mail.app
defaults write com.apple.mail AppleLnguages "(English)"
# can use "en", too.
# Change to Japanese
#defaults write com.apple.mail AppleLnguages "(Japanese)"
# can use "ja", too, but can't use "jp"
# Use system default language
#defaults delete com.apple.mail AppleLnguages
# Check set languages
#defaults find AppleLanguages
# }}}

# Attachment in Mail.app {{{
# Show attachment as is (default)
#defaults write com.apple.mail DisableInlineAttachmentViewing
# Show attachment as a file icon
defaults write com.apple.mail DisableInlineAttachmentViewing 1
# }}}

# Change window's grab points to change window size {{{
# Set to 10 (only outer region)
#defaults -g AppleEdgeResizeExteriorSize 10 (pixel?)
# Rest to Default
#defaults delete -g AppleEdgeResizeExteriorSize
# }}}

# Change fonts {{{
# Change a font in Finder
#defaults write com.apple.finder NSSystemFont -string HuiFont
# Rest to Default
#defaults delete com.apple.finder NSSystemFont

# Change a font in Title bar
#defaults write com.apple.finder NSTitleBarFont -string HuiFont
# Rest to Default
#defaults delete com.apple.finder NSTitleBarFont

# Change a font size in Title bar
#defaults write com.apple.finder NSTitleBarFontSize 18
# Rest to Default
#defaults delete com.apple.finder

# Change a font in Tool Tips
#defaults write -g NSToolTipsFont -string HuiFont
# Rest to Default
#defaults delete -g NSToolTipsFont

# Change a font size in Tool Tips
#defaults write NSGlobalDomain NSToolTipsFontSize -int 18
# Rest to Default
#defaults delete NSGlobalDomain NSToolTipsFontSize
# }}}

# Finder's Quit Menu {{{
# Show
defaults write com.apple.Finder QuitMenuItem -bool true
# Don't show (default)
#defaults delete com.apple.Finder QuitMenuItem
# }}}

# Trackpad, enable three finger swipe up/down {{{
# Only for bluetooth one...?
# Enable
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture  -float 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture  -float 1
# Disable
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture  -float 0
#defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture  -float 0
# }}}

# Require password after sleep or screen saver {{{
## Enable
#defaults write com.apple.screensaver askForPassword -int 1
## Disable
#defaults write com.apple.screensaver askForPassword -int 0
## ask after 60 sec at screen saver
#defaults write com.apple.screensaver askForPasswordDelay -int 60
# }}}

# recent used application? {{{
#defaults write com.apple.dock persistent-others -array-add '{{{ "tile-data" = {{{ "list-type" = 1; }}}; "tile-type" = "recents-tile"; }}}';killall Dock
# }}}

# Index on/off {{{
## check volume's status (HDPS-U320 is external HDD)
#$ mdutil -s "/Volumes/HDPS-U320"
#  /:
#          Indexing enabled.
#
## disable indexing (for main drive (Macintosh HD), need to be root)
#$ mdutil -i off "/Volumes/HDPS-U320"
#  /Volumes/HDPS-U320:
#          Indexing disabled.
## enable indexing (for main drive (Macintosh HD), need to be root)
#$ mdutil -i on "/Volumes/HDPS-U320"
#  /Volumes/HDPS-U320:
#          Indexing enabled.
# }}}

# change wallpaper for Mission Control {{{
##change  /System/Library/CoreServices/Dock.app/Contents/Resources/defaultdesktop.png
#killall Dock
# }}}

# QuickLook{{{
##in Finder, push space
#}}}

#change directory name to English {{{
#back up: /System/Library/CoreServices/SystemFolderLocalizations/Japanese.lproj/SystemFolderLocalizations.strings
#cp /System/Library/CoreServices/SystemFolderLocalizations/en.lproj/SystemFolderLocalizations.strings /System/Library/CoreServices/SystemFolderLocalizations/Japanese.lproj/
# }}}

# open finder from terminal {{{
#open . #open current directory by Finder
#any files can be open by "open" command, which will be opend by the associated application
# }}}

#Service created by Automator {{{
#~/Library/Services
#}}}

#Change character encoding {{{
# nkf is not installed in Mac
# but Mac has iconv/piconv
# usage:
# $ iconv -f utf-8 -t eucjp file # utf8->eucjp
# $ piconv -f utf-8 -t eucjp file # utf8->eucjp
#}}}

# Key map {{{
#echo "Make ⌘ + F focus the search input in iTunes"
#defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"
#}}}


# Set Locale {{{
#defaults write NSGlobalDomain AppleLocale -string "en_US_POSIX"
#defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
#defaults write NSGlobalDomain AppleMetricUnits -bool true
# }}}

# Disable sound at start up {{{
#sudo nvram SystemAudioVolume=%80
#}}}

# Disable Notification Center {{{
#launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist killall NotificationCenter
#}}}

# Temporary time to sleep (sec) {{{
#caffeinate -t 3600
#}}}

#  Aboid to create .DS_Store {{{
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
#}}}

# Disable auto correct {{{
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
#}}}
