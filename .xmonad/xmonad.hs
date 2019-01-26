import qualified Codec.Binary.UTF8.String as UTF8
import Data.Monoid

import XMonad
import qualified Data.Map as M
import Data.List
import Graphics.X11.ExtraTypes.XF86
import XMonad.Actions.CycleWS
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.PerWorkspace
import XMonad.Layout.IM
import XMonad.Layout.Grid
import qualified XMonad.Layout.Fullscreen as FS
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.DynamicLog
import System.IO
import Control.Monad
import qualified XMonad.StackSet as W

import XMonad.Hooks.EwmhDesktops (ewmh, fullscreenEventHook)
import XMonad.Hooks.ManageDocks
import XMonad.Config.Desktop
import XMonad.Util.SpawnOnce

myTerminal      = "alacritty"
myFocusFollowsMouse = False
myClickJustFocuses = False

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ("M-x f", spawn "firefox") ] 

myModMask       = mod1Mask -- or mod4Mask for super
myWorkspaces    = ["terminal","ide","web"]

myLayout = tiled ||| (Mirror tiled) ||| Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = toRational (2 / (1 + sqrt 5 :: Double))

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "Firefox-bin" --> doShift "web"
    , (className =? "Firefox" <&&> resource =? "Dialog") --> doFloat
    , className =? "Xmessage" --> doFloat
    , isFullscreen                  --> doFullFloat
    , FS.fullscreenManageHook ]

myStartupHook = do
  spawnOnce "$HOME/.config/polybar/launch.sh"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.
main = do
    xmonad $ desktopConfig {
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = 0,
        modMask            = myModMask,
        keys               = \c -> myKeys c `M.union` keys XMonad.def c,
        workspaces         = myWorkspaces,
        layoutHook         = desktopLayoutModifiers $ noBorders $ myLayout,
        manageHook         = myManageHook <+> manageHook desktopConfig,
        handleEventHook    = fullscreenEventHook <+> handleEventHook desktopConfig,
        startupHook        = myStartupHook <+> startupHook desktopConfig
    }
