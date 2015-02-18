import XMonad
import XMonad.Config
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import XMonad.Util.EZConfig
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.NoBorders
import XMonad.Actions.Search
import XMonad.Prompt

import System.IO

main = statusBar myBar myPP toggleStrutsKey myConfig >>= xmonad

myBar = "xmobar"

myTerminal      = "terminator"

myFocusFollowsMouse = False

myClickJustFocuses = False

myBorderWidth = 0

myModMask = mod4Mask

myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myKeys = [ ("<XF86AudioRaiseVolume>", spawn "pamixer --increase 5")
         , ("<XF86AudioLowerVolume>", spawn "pamixer --decrease 5")
         , ("<XF86AudioMute", spawn "pamixer --toggle-mute")
         , ("<XF86AudioNext>", spawn "playerctl next")
         , ("<XF86AudioPrev>", spawn "playerctl previous")
         , ("<XF86AudioPlay>", spawn "playerctl play-pause")
         , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 5")
         , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5")
         , ("M-c", spawn "chromium")
         , ("M-a", spawn "audacious")
         , ("M-v", spawn "vlc")
         , ("M-f", spawn "firefox")
         , ("M-S-l", spawn "xscreensaver-command -lock")
         , ("M-z", spawn "toggleTouchpad")
         , ("M-d", spawn "toggleDisplay")
         ]
         ++ [("M-s " ++ k, promptSearchBrowser defaultXPConfig "chromium" e) | (k, e) <- searchList]
         ++ [("M-S-s " ++ k, selectSearchBrowser "chromium" e) | (k, e) <- searchList]

searchList :: [(String, SearchEngine)]
searchList = [ ("g", google)
             , ("h", hoogle)
             , ("w", wikipedia)
             , ("y", youtube)
             , ("m", maps)
             , ("a", amazon)
             ]

myRemKeys = []

myLayout = smartBorders $ (layoutHook defaultConfig) ||| noBorders Full

myConfig = defaultConfig
    { terminal          = myTerminal
    , modMask           = myModMask
    , borderWidth       = myBorderWidth
    , focusFollowsMouse = myFocusFollowsMouse
    , clickJustFocuses  = myClickJustFocuses
    , layoutHook        = myLayout
    } `removeKeysP` myRemKeys
      `additionalKeysP` myKeys
