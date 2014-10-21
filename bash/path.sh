#!/bin/bash

### Added by the Heroku Toolbelt
export PATH="${PATH}:/usr/local/heroku/bin"

export ANDROID_HOME=~/Development/android-sdk-macosx
export GRADLE_HOME=/usr/local/gradle-1.6

export PATH=${PATH}:$GRADLE_HOME/bin
export PATH=${PATH}:$ANDROID_HOME/tools
export PATH=${PATH}:$ANDROID_HOME/platform-tools
export PATH=${PATH}:~/bin
export PATH=$PATH:/usr/local/mysql/bin

# Setting PATH for Python 3.3
# The orginal version is saved in .bash_profile.pysave
PATH="${PATH}:/Library/Frameworks/Python.framework/Versions/3.3/bin"
export PATH
