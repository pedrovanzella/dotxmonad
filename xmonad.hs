-- default desktop configuration for Fedora

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
	xmonad $ defaultConfig
		{ terminal = "terminator"
		, borderWidth = 2
		, normalBorderColor = "#cccccc"
		, focusedBorderColor = "#cd8b00"
		, manageHook = manageDocks <+> manageHook defaultConfig
		, layoutHook = avoidStruts  $  layoutHook defaultConfig
		}
