-- default desktop configuration for Fedora

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
	xmproc <- spawnPipe "xmobar ~/.xmonad/xmobarrc"
	xscproc <- spawn "xscreensaver -no-splash &"
	xmonad $ defaultConfig
		{ terminal = "terminator"
		, borderWidth = 2
		, normalBorderColor = "#cccccc"
		, focusedBorderColor = "#cd8b00"
		, manageHook = manageDocks <+> manageHook defaultConfig
		, layoutHook = avoidStruts  $  layoutHook defaultConfig
		, logHook = dynamicLogWithPP xmobarPP
						{ ppOutput = hPutStrLn xmproc
						, ppTitle = xmobarColor "green" "" . shorten 50
						}
		} `additionalKeys`
		[ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
		, ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
		, ((0, xK_Print), spawn "scrot")
		]
