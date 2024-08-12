Screenshots

![Screenshot](.screenshots/xmonad.png?raw=true "Bussy")


```
import XMonad
import XMonad.Util.SpawnOnce

main = xmonad $ def
    { startupHook = myStartupHook }

myStartupHook = do
    spawnOnce "trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --transparent true --alpha 0 " ++ colorTrayer ++ " --height 22 &"
    spawnOnce "volumeicon &"
    spawnOnce "nm-applet &"

```
