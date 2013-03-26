# Tips
# For boolean values, yes=true, no=false ?

# hide .* files {{{
# hide
defaults write com.apple.finder AppleShowAllFiles -bool no;killall Finder

# unhide
#defaults write com.apple.finder AppleShowAllFiles -bool yes;killall Finder
# }}}

# move to previous desktop space by 4 finger double tap {{{
# enable
#defaults write com.apple.dock double-tap-jump-back -bool true;killall Dock
# disable
defaults delete com.apple.dock double-tap-jump-back -bool false;killall Dock
# }}}

# path bar in Finder starts from home directory {{{
# enable
#defaults write com.apple.finder PathBarRootAtHome -bool yes;killall Finder
# disable
defaults delete com.apple.finder PathBarRootAtHome -bool no;killall Finder
# }}}

# enlarge window size for mission control, when scroll up mouse, or swipe up with two fingers {{{
# enable
defaults write com.apple.dock expose-cluster-scale -float 1;killall Dock
# disable
#defaults delete com.apple.dock expose-cluster-scale -float 0;killall Dock
# }}}

# Show windows when scroll up on an icon on the dock {{{
# enable
defaults write com.apple.dock scroll-to-open -bool yes;killall Dock
# disable
#defaults delete com.apple.dock scroll-to-open;killall Dock
#}}}

# 2D/3D dock {{{
# 2D
defaults write com.apple.dock no-glass -bool true;killall Dock
# 3D (glass effect)
#defaults delete com.apple.dock no-glass;killall Dock
#}}}

# disable to make MacOS catalogue file (.DS_Store) {{{
# disable
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
# enable
#defaults write com.apple.desktopservices DSDontWriteNetworkStores false
# }}}

# show full path in title bar {{{
# enable
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true;killall Finder
# disable
#defaults delete com.apple.inder _FXShowPosixPathInTitle -bool false;killall Finder
# }}}

# show Libary{{{
# show
chflags nohidden ~/Library/
# hide
#chflags hidden ~/Library/
# }}}

# XRayFolder (not valid for lion...) {{{
# enable
#defaults write com.apple.Finder QLEnableXRayFolders -bool true;killall Finder
# disable
#defaults delete com.apple.Finder QLEnableXRayFolders -bool false;killall Finder
# }}}

# Enable copy in quick look {{{
# enable
defaults write com.apple.finder QLEnableTextSelection -bool true; killall Finder
# disable
#defaults delete com.apple.finder QLEnableTextSelection -bool false; killall Finder
# }}}

# Stop Quick Look when move to other application {{{
# Stop
#defaults write com.apple.finder QLHidePanelOnDeactivate -bool true
# Continue to show (default)
#defaults delete com.apple.finder QLHidePanelOnDeactivate
# }}}

# disable dashboard {{{
# disable
defaults write com.apple.dashboard mcx-disabled -bool true;killall Dock
# enable
#defaults delete com.apple.dashboard mcx-disabled -bool false;killall Dock
# }}}

# remove shadow from screen shot {{{
# remove
defaults write com.apple.screencapture disable-shadow -bool true;killall SystemUIServer
# add shadow
#defaults delete com.apple.screencapture disable-shadow -bool false;killall SystemUIServer
# }}}

# Mail address copy in Mail.app {{{
# Remove alias (name) and copy only mail address
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
# Copy both alias (name) and mail address (default)
#defaults delete com.apple.mail AddressesIncludeNameOnPasteboard -bool true
# }}}

# Attachment in Mail.app {{{
# Show attachment as is (default)
defaults write com.apple.mail DisableInlineAttachmentViewing
# Show attachment as a file icon
#defaults write com.apple.mail DisableInlineAttachmentViewing 1
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

