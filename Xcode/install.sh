#/bin/bash
XCODE_KEYBINDINGS_DIR=/Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Resources/
XCODE_BETA_KEYBINDINGS_DIR=/Applications/Xcode-beta.app/Contents/Frameworks/IDEKit.framework/Resources/

echo "Copying over Xcode UserData..."
cp -ir ./UserData ~/Library/Developer/Xcode/

if [[ -d "$XCODE_BETA_KEYBINDINGS_DIR" ]]; then
    echo "Copying over Xcode custom keybindings..."
    sudo cp -i ./IDETextKeyBindingSet.plist "$XCODE_KEYBINDINGS_DIR"
fi

if [[ -d "$XCODE_BETA_KEYBINDINGS_DIR" ]]; then
    echo "Copying over Xcode beta custom keybindings..."
    sudo cp -i ./IDETextKeyBindingSet.plist "$XCODE_BETA_KEYBINDINGS_DIR"
fi

echo "Copying over Xcode preferences..."
cp -i ./com.apple.dt.Xcode.plist ~/Library/Preferences/
echo 'Done!'
