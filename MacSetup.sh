#Touch IDの登録。
#
#GitHubに鍵登録
#$ mkdir -p ~/.ssh && chmod 700 ~/.ssh
#$ ssh-keygen
#(~/.ssh/github_rsa)
#$ cat << EOF > ~/.ssh/config
#Host github.com
#  HostName github.com
#  IdentityFile ~/.ssh/github_rsa
#EOF
#
#できた~/.ssh/github_rsa.pubをGitHubに登録。
#
#Homebrewのインストール:
#$ curl -fsSL https://raw.github.com/rcmdnk/homebrew-file/install/install.sh |sh
#
#これでgitも入るので、
#$ cd ~
#$ mkdir -p usr/share
#$ cd usr/share
#$ git clone --recursive git@github.com:rcmdnk/settings
#$ cd settings
#$ ./update.sh 
#
#同時にBrewfileを設定
#$ brew file set_repo
#rcmdnk/Brewfile を指定
#
#システム環境設定:
#
#• Apple ID の設定
#*
#$ brew file install
#途中、ちょくちょくパスワードを聞かれるので見ながら(この辺改善したい。。。)
#
#上をやりながら環境設定やアプリ設定を
#

#* 一般
#    * 外観モード: ダーク
defaults write -g AppleInterfaceStyle -string "Dark" # need restart...?
# defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark" -g = NSGlobalDomain

#    * 強調表示色: グラファイト
defaults write -g AppleHighlightColor -string "0.847059 0.847059 0.862745 Graphite" # need restart...?
#   *スクロールバー表示: 常に表示
defaults write -g AppleShowScrollBars -string "Always"
#* デスクトップとスクリーンセーバー
#    * デスクトップ: 無地の色右真ん中にある黒目の灰色。
#    * スクリーンセーバー: 開始までの時間: 開始しない
#• Dock
#    • サイズ: 全体の1/4くらいの位置の小さめ
defaults write com.apple.dock tilesize -int 25
#    • 拡大: チェックを外す
defaults write com.apple.dock magnification -bool false
#    • Dockを自動的に表示/非表示: チェック
defaults write com.apple.dock autohide -bool true
#    • 最近使ったアプリケーションをDockに表示:チェックを外す
defaults write com.apple.dock show-recents -bool false
# DockのFinder/ゴミ箱以外全て消す
defaults write com.apple.dock persistent-apps -array

killall Dock

#•Mission Control
#最新の仕様状況に基づいて操作スペースを自動的に並べ替える: チェックを外す。
defaults write com.apple.dock mru-spaces -bool false
#アプリケーションの切り替えで、アプリケーションのウィンドウが開いている操作スペースに移動: チェックしたまま
defaults write -g AppleSpacesSwitchOnActivate -bool true
#ウインドウをアプリケーションごとにグループ化: チェックを外す。
defaults write com.apple.dock expose-grouop-apps -bool false
#ディスプレイ毎に個別の操作スペース: チェックを外さない(メニューバーやDockを両方に表示できる様にするため)
defaults write com.apple.spaces spans-displays -bool true
#• ユーザとグループ
#    • 左下の鍵をクリックして解除、左のリストから自分を右クリックして詳細オプション-> ログインシェルをbashに(後でHomebrew版にする?)
# Change login shell
chsh -s /bin/bash
# sudo dscl . -create /Users/$USER UserShell /usr/local/bin/bash

#• アクセシビリティ
#    • ポインタコントロール: マウスとトラックパッド, トラックパッドオプション
#        • トラックパッドオプション
#ドラッグを有効にする: チェック
#ドラッグロックあり、に変更 -> 以下のdefualtsコマンドはトラックパッドのところでまとめて
#defaults write com.apple.AppleMultitouchTrackpad DragLock -bool true
#defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool true
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true
# 3本指ドラッグにしたい場合は以下
#defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
#
#• • プリンタとスキャナ
#    • プリンタを設定
#• キーボード
#• キーのリピート: 最速 (小さい方が速い(msで間隔?)システム環境設定の最大速が2
defaults write -g KeyRepeat -int 1
#リピート入力認識までの時間: 最短 (小さい方が速い、システム環境設定の最大値だと15
defaults write NSGlobalDomain InitialKeyRepeat -int 10
#ユーザー辞書
#英字入力中にスペルを自動変換: チェックを外す
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
#文頭を自動的に大文字にする: チェックを外す
defaults write -g NSAutomaticCapitalizationEnabled -bool false
#スペースバーを2回押してピリオドを入力: チェックを外す
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
#スマート引用符とスマートダッシュを使用: チェックを外す
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
#    • ショートカット
#        • 入力メニューの次のソースを選択、にチェック(デフォルトで入ってない?)
# [macos - Is there a way to set an Application Shortcut in the Keyboard Preference Pane via Terminal? - Ask Different](https://apple.stackexchange.com/questions/91679/is-there-a-way-to-set-an-application-shortcut-in-the-keyboard-preference-pane-vi)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 61 "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>32</integer><integer>49</integer><integer>786432</integer></array><key>type</key><string>standard</string></dict></dict>"
#        • 入力ソース: Google日本語入力の英数とひらがなを追加しデフォルトの日本語を削除。
#* トラックパッド
#     * 調べる&データ検出: チェック外す
defaults write -g com.apple.trackpad.forceClick -bool false
#     * 副ボタンのクリック: 右下隅をクリック(二本指での副ボタンはBetterTouchToolで設定)
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 2 # default 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 0 # default 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2 # default 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 0 # default 1
#     * タップでクリック: チェックして一本指でタップ
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1 # default 0
defaults write com.apple.AppleMultitouchTrackpad DragLock -int 1 # default 0
defaults write com.apple.AppleMultitouchTrackpad Dragging -int 1 # default 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1 # default 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -int 1 # default 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -int 1 # default 0
#クリック: 中、から、弱い、に。（物理クリックでないのでこれが変更できるのが凄い。) (0, 1, 2)
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0
#軌跡の速さ: 最速に (0-3, 少数も使える)
defaults -currentHost write -g com.apple.trackpad.scaling 3
#     *  サイレントクリック: チェック
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -bool true
#     *  強めのクリックと感触フィードバック; チェック
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -bool true
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool false
#     *  スクロールの方向: ナチュラル: チェック
defaults write -g com.apple.swipescrolldirection -bool true
#     * 拡大/縮小; チェック
defaults write com.apple.AppleMultitouchTaackpad TrackpadPinch -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -bool true
#     * スマートズーム: チェックを外す
defaults write com.apple.AppleMultitouchTaackpad TrackpadTwoFingerDoubleTapGesture -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -bool false
#     * 回転: チェック
defaults write com.apple.AppleMultitouchTaackpad TrackpadRotate -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool false
#     * ページ間をスワイプ: チェックを外す
defaults write -g AppleEnableSwipeNavigateWithScrolls -bool false
#     * フルスクリーンアプリケーション間をスワイプ: 4本指で左右にスワイプ
defaults write com.apple.AppleMultitouchTaackpad TrackpadThreeFingerHorizSwipeGesture -int 0 # default 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture  -int 0 # default 2
defaults write com.apple.AppleMultitouchTaackpad TrackpadFourFingerHorizSwipeGesture -int 2 # default 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture  -int 2 # default 0
#     * 通知センター: チェックを外す
defaults write com.apple.AppleMultitouchTaackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0  # default 3
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0 # default 3
#     * Mission Control: ４本指で上にスワイプ (これとしたのExposeは3本指か4本指かは共通)
defaults write com.apple.dock showMissionControlGestureEnabled -bool true
#     * アプリケーションExpose: ４本指で下にスワイプ
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
defaults write com.apple.AppleMultitouchTaackpad TrackpadThreeFingerVertSwipeGesture -int 0 # default 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad  TrackpadThreeFingerVertSwipeGesture -int 0 # default 2
defaults write com.apple.AppleMultitouchTaackpad TrackpadFourFingerVertSwipeGesture -int 2 # default 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad  TrackpadFourFingerVertSwipeGesture -int 2 # default 0
#     * LaunchPad: 親指と3本指でピンチ
defaults write com.apple.dock showLaunchpadGestureEnabled -bool true
defaults write com.apple.AppleMultitouchTaackpad TrackpadFiveFingerPinchGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad  TrackpadFiveFingerPinchGesture -int 2
defaults write com.apple.AppleMultitouchTaackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad  TrackpadFourFingerPinchGesture -int 2
#     * デスクトップを表示: チェックを外す
defaults write com.apple.dock showDesktopGestureEnabled -bool false
#• ディスプレイ: 解像度->変更->スペースを拡大
#* 日付と時刻
#時計
#日付を表示
defaults write com.apple.menuextra.clock DateFormat -string "M d E HH:mm" && killall SystemUIServer
#アクセシビリ
#


# Finder
## Do not show external media
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
## Do not show internal media
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
## Do not show removable media
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
## Do not show network volumes
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
## Show all file extensions
defaults write -g AppleShowAllExtensions -bool true
## Show hidden files
defaults write com.apple.finder AppleShowAllFiles true
## show extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
## Show full path in finder title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
## Show library
chflags nohidden ~/Library
## Show Quit Finder
defaults write com.apple.finder QuitMenuItem -bool true
## Show directories first
defaults write com.apple.finder _FXSortFoldersFirst -bool true
## Disable confirmation of non-confirmed application
defaults write com.apple.LaunchServices LSQuarantine -bool false


killall Finder



# Avoids creation of .DS_Store and AppleDouble files on Network Volumes, USB Volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable CrashReport
defaults write com.apple.CrashReporter DialogType -string "none"






#Chrome
#*  ログイン
#• 同期で入れられるLastPassにログイン
#• もし初期設定してなかったら、chromeの設定からパスワードの管理をしないように設定変更（管理はLastPassで)
#• cvim: 手動 https://github.com/1995eaton/chromium-vimか、なければhttps://github.com/rcmdnk/chromium-vim
#• https://rcmdnk.com/blog/2018/04/24/computer-chrome-vim/
#• https://rcmdnk.com/blog/2017/11/18/computer-chrome/
#-> 使ったパッケージは残し続けないといけないので~/Documentsに置いておく。
#
#Box:
#
#Volume Reset:
#ログイン時に立ち上げ、スリープ解除や再起動時にMuteにリセットするように
#
#Zoom.us:
#メニューバーに表示しない
defaults write ZoomChat ZoomShowIconInMenuBar -string "false"
#背景を設置

#
#Clipy:
#ログイン時に起動、メニューバーに表示させない設定など
defaults write com.clipy-app.Clipy loginItem -int 1
defaults write com.clipy-app.Clipy kCPYPrefShowStatusItemKey -int 0
#保存件数100に。
defaults write com.clipy-app.Clipy kCPYPrefMaxHistorySizeKey -int 100
#フォルダ内の項目数20
defaults write com.clipy-app.Clipy kCPYPrefNumberOfItemsPlaceInsideFolderKey -int 20
# 表示する文字数100
defaults write com.clipy-app.Clipy kCPYPrefMaxMenuItemTitleLengthKey -int 100
#表示するショートカットをopt-Cに

#
#BetterTouchTool:
#ライセンス認証、プロファイルをimport
#ログイン時に起動、メニューバーに表示させない設定など
#
#Karabiner-Element:
#https://rcmdnk.com/KE-complex_modifications/
#Vim emuration, Personal Settingsをimportし、それぞれEnable all (Vim emurationが上にあるべき)
#ログイン時に起動、メニューバーに表示させない設定など
#
#メニューバーに表示させない設定など
#
#HyperSwitch:
#ログイン時に起動、メニューバーに表示させない設定など
#SwitcherのmodifierをControl(0)に(defaultはこれら設定無しでOpt(1?), 2でCommand)
com.bahoom.HyperSwitch run_in_background -bool true
com.bahoom.HyperSwitch show_status_menu -bool false
com.bahoom.HyperSwitch window_switcher_current_app_mod -int 0
com.bahoom.HyperSwitch window_switcher_mod -int 0
# Dockから削除
#
#Caffeine
#ログイン時に起動、Dockやメニューバーに表示させない設定など
#
#
#Slack:
#rcmdnk
#追加
#Mac起動時に自動で起動するオプションはないので、
#システム環境設定のユーザとグループ、でログイン項目にSlackを追加(非表示、にチェック)
#
#Chatwork:
#アプリだと結構な頻度(1日ごと?)でログアウトし、そのたびに手でmailやパスワードを入力しないといけなくてかなり面倒
#Web版ならLastPassとか使えるので、Web版を開くようにする。
#
#iTerm:
#Preferences
#General
#config
#[x] Quit when all windows are closed 
defaults write com.googlecode.iterm2 QuitWhenAllWindowsClosed -bool true
#[ ] Confirm closing multiple sessions
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
#[ ] Confirm Quit iTerm2
defaults write com.googlecode.iterm2 OnlyWhenMoreTabs -bool false
#Profiles->Terminal: Silence bellにチェック
#
#Appearance:
#General: Theme: Compact (Minimalだとbarが黒くなるが、Compactの方がさらに小さくなる), Tab bar location: Top (CompactでBottomだとbarが消える...?消えると掴んで移動できなくなって困る) Status bar location: Bottom
#
#Google日本語入力
#環境設定でキー設定の選択、でことえりからMS-IMEに変更(Ctrl-Iでカタカナ、とかがことえりだとCtrl-Kだったり、色々違う。MSの方になれてるのでそっち)
#
#/Library/Input Methods/GoogleJapaneseInput.app/Contents/Resources
#の
#direct.tiff
#hiragana.tiff
#の絵をグレーに
#（プレビューで開いて名前を付けて保存で、PDFで保存しようとするとGray Toneが選べてグレースケールにできる。それをさらにtiffにする、とか
#もしくは、ツール、カラーを調整、で彩度を0にすれば直接出来る(仕上がりはちょっと違う感じになる)
#
#
#
#GlobalProtect:
#Microsoft Remote Desktopに
