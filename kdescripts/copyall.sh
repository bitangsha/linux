#!/bin/bash
echo "Copying files"
PLASMA5=$(plasmashell --version | grep -q "^plasmashell 5" && echo true || echo false)
MENUPATH='/usr/share/kio/servicemenus'
if [ "$PLASMA5" = true ]; then
    MENUPATH="$HOME/.local/share/kservices5/servicemenus"
fi
sudo cp -r kservices5/ServiceMenus/* "$MENUPATH/"
mkdir -p ~/Scripts
cp -r -p Scripts/* ~/Scripts/
echo "Icon=$MENUPATH/icons/davinci.png" | sudo tee -a "$MENUPATH/ConvertToMov.desktop" > /dev/null
echo "Icon=$MENUPATH/icons/davinci.png" | sudo tee -a "$MENUPATH/ConvertToMp4.desktop" > /dev/null
echo "Icon=$MENUPATH/icons/davinci.png" | sudo tee -a "$MENUPATH/RemoveAudio.desktop" > /dev/null
echo "Icon=$MENUPATH/icons/davinci.png" | sudo tee -a "$MENUPATH/ExtractAudio.desktop" > /dev/null
echo "Icon=$MENUPATH/icons/image.png" | sudo tee -a "$MENUPATH/SvgToPng.desktop" > /dev/null
echo "Icon=$MENUPATH/icons/image.png" | sudo tee -a "$MENUPATH/WebpToJpg.desktop" > /dev/null
chmod -R +x ~/Scripts/
echo "All Finished!"
