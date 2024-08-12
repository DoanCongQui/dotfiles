Screenshots

![Screenshot](.screenshots/xmonad.png?raw=true "Bussy")


```
import XMonad
import XMonad.Util.SpawnOnce
import qualified Data.Map as M
import Data.Maybe (fromJust)

myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..] -- (,) == \x y -> (x,y)

clickable ws = "<action=xdotool key super+"++show i++">"++ws++"</action>"
    where i = fromJust $ M.lookup ws myWorkspaceIndices



main = xmonad $ def
    { startupHook = myStartupHook }

myStartupHook = do
    spawnOnce "trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --transparent true --alpha 0 " ++ colorTrayer ++ " --height 22 &"
    spawnOnce "volumeicon &"
    spawnOnce "nm-applet &"

```
