#/bin/bash
echo "Copying over Xcode UserData..."
cp -ir ./UserData ~/Library/Developer/Xcode/
echo "Copying over Xcode custom keybindings..."
sudo cp -i ./IDETextKeyBindingSet.plist /Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Resources/
echo "Copying over Xcode preferences..."
cp -i ./com.apple.dt.Xcode.plist ~/Library/Preferences/
echo 'Done!'
