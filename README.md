Screenshots

![Screenshot](.screenshots/xmonad.png?raw=true "Bussy")


```
import XMonad
import XMonad.Util.SpawnOnce

main = xmonad $ def
    { startupHook = myStartupHook }

myStartupHook = do
    spawnOnce "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --widthtype request --transparent true --alpha 0 --tint 0x000000 --height 24 &"
    spawnOnce "volumeicon &"
    spawnOnce "nm-applet &"

```
