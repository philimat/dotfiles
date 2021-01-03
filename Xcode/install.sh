#/bin/bash
XCODE_KEYBINDINGS_DIR=/Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Resources/
XCODE_BETA_KEYBINDINGS_DIR=/Applications/Xcode-beta.app/Contents/Frameworks/IDEKit.framework/Resources/
SCRIPT_DIR=$(dirname "$0")

echo "Copying over Xcode UserData..."
cp -ir $SCRIPT_DIR/UserData ~/Library/Developer/Xcode/

if [[ -d "$XCODE_BETA_KEYBINDINGS_DIR" ]]; then
    echo "Copying over Xcode custom keybindings..."
    sudo cp -i $SCRIPT_DIR/IDETextKeyBindingSet.plist "$XCODE_KEYBINDINGS_DIR"
fi

if [[ -d "$XCODE_BETA_KEYBINDINGS_DIR" ]]; then
    echo "Copying over Xcode beta custom keybindings..."
    sudo cp -i $SCRIPT_DIR/IDETextKeyBindingSet.plist "$XCODE_BETA_KEYBINDINGS_DIR"
fi

echo "Copying over Xcode preferences..."
cp -i $SCRIPT_DIR/com.apple.dt.Xcode.plist ~/Library/Preferences/
echo 'Xcode config files succesfully installed!'
