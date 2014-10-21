# Sets mac osx defaults

# Only open things in Finder List View
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show ~/Library directory
chflags nohidden ~/Library

# Show External HDs and Removable Media on Desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

