#!/usr/bin/env bash
XCODE_KEYBINDINGS_DIR=/Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Resources/
XCODE_BETA_KEYBINDINGS_DIR=/Applications/Xcode-beta.app/Contents/Frameworks/IDEKit.framework/Resources/
SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo "Copying over Xcode UserData..."
cp -ir $SCRIPT_DIR/UserData ~/Library/Developer/Xcode/

if [[ -d "$XCODE_KEYBINDINGS_DIR" ]]; then
    echo "Linking Xcode custom keybindings..."
    sudo ln -sfv $SCRIPT_DIR/IDETextKeyBindingSet.plist "$XCODE_KEYBINDINGS_DIR"
fi

if [[ -d "$XCODE_BETA_KEYBINDINGS_DIR" ]]; then
    echo "Linking Xcode beta custom keybindings..."
    sudo ln -sfv $SCRIPT_DIR/IDETextKeyBindingSet.plist "$XCODE_BETA_KEYBINDINGS_DIR"
fi

echo "Linking Xcode preferences..."
ln -sfv $SCRIPT_DIR/com.apple.dt.Xcode.plist ~/Library/Preferences/
echo 'Xcode config files succesfully installed!'
