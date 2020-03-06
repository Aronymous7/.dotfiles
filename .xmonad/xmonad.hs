------------------------------------------------------------------------
---IMPORTS
------------------------------------------------------------------------
    -- Base
import XMonad
import XMonad.Config.Desktop
import Data.Maybe (isJust)
import System.IO (hPutStrLn)
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W

    -- Utilities
import XMonad.Util.EZConfig (additionalKeysP, removeKeysP)
import XMonad.Util.Run (spawnPipe)

    -- Hooks
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.ManageDocks (avoidStruts, ToggleStruts(..))
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName

    -- Actions
import XMonad.Actions.SpawnOn
import XMonad.Actions.CopyWindow (kill1)
import XMonad.Actions.CycleWS (moveTo, shiftTo, Direction1D(Next, Prev), WSType(WSIs))
import XMonad.Actions.MouseResize

    -- Layouts modifiers
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.Spacing (spacingWithEdge)
import XMonad.Layout.NoBorders

    -- Layouts
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.ResizableTile

------------------------------------------------------------------------
---CONFIG
------------------------------------------------------------------------
myModMask       = mod4Mask
myTerminal      = "st"
windowCount     = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ desktopConfig
        { manageHook = manageSpawn <+> myComposeOne
        , logHook = dynamicLogWithPP xmobarPP
            { ppOutput = \x -> hPutStrLn xmproc x
            , ppCurrent = xmobarColor "#c3e88d" "" . wrap "[" "]"   -- Current workspace in xmobar
            , ppVisible = xmobarColor "#c3e88d" ""                  -- Visible but not current workspace
            , ppHidden = xmobarColor "#82AAFF" "" . wrap "*" ""     -- Hidden workspaces in xmobar
            , ppHiddenNoWindows = xmobarColor "#F07178" ""          -- Hidden workspaces (no windows)
            , ppTitle = xmobarColor "#d0d0d0" "" . shorten 80       -- Title of active window in xmobar
            , ppSep =  "<fc=#9AEDFE> : </fc>"                       -- Separators in xmobar
            , ppUrgent = xmobarColor "#C45500" "" . wrap "!" "!"    -- Urgent workspace
            , ppExtras  = [windowCount]                             -- # of windows current workspace
            , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
            }
        , modMask               = myModMask
        , terminal              = myTerminal
        , startupHook           = myStartupHook
        , layoutHook            = myLayoutHook
        , borderWidth           = 2
        , focusFollowsMouse     = False
        , normalBorderColor     = "#292d3e"
        , focusedBorderColor    = "#bbc5ff"
        }   `additionalKeysP`   myKeys
            `removeKeysP`       myRemoveKeys

myComposeOne = composeOne
    [ isDialog                  -?> doFloat
    , className =? "Nitrogen"   -?> doFloat
    , return True               -?> doF W.swapDown
    ]

------------------------------------------------------------------------
---AUTOSTART
------------------------------------------------------------------------
myStartupHook = do
    spawnOn "2" "st -- tmux new-session -s main \\; split-window -h \\; split-window -v \\; select-pane -U \\; select-pane -L"
    spawnOn "3" "firefox"
    spawnOn "4" "thunderbird"
    setWMName "LG3D"

------------------------------------------------------------------------
---KEYBINDINGS
------------------------------------------------------------------------
myKeys =
    [ ("M-S-r", spawn "xmonad --restart")   -- Restarts xmonad
    , ("M-S-e", io exitSuccess)             -- Quits xmonad

    , ("M-S-q", kill1)                      -- Kill the currently focused client

    , ("M-i", windows W.focusMaster)        -- Move focus to the master window
    , ("M-j", windows W.focusDown)          -- Move focus to the next window
    , ("M1-<Tab>", windows W.focusDown)
    , ("M-k", windows W.focusUp)            -- Move focus to the prev window
    , ("M1-S-<Tab>", windows W.focusUp)
    , ("M-S-i", windows W.swapMaster)       -- Swap the focused window and the master window
    , ("M-S-j", windows W.swapDown)         -- Swap the focused window with the next window
    , ("M-S-k", windows W.swapUp)           -- Swap the focused window with the prev window

    , ("M-C-h", sendMessage Shrink)             -- Resize horizontally
    , ("M-C-l", sendMessage Expand)
    , ("M-C-j", sendMessage MirrorShrink)       -- Resize vertically
    , ("M-C-k", sendMessage MirrorExpand)
    , ("M-<Delete>", sendMessage ToggleStruts)  -- Cover status bar on/off

    , ("M-l", moveTo Next nonEmptyWSs)          -- Go to next non-empty workspace
    , ("M-<Tab>", moveTo Next nonEmptyWSs)
    , ("M-<Right>", moveTo Next allWSs)         -- Go to next non-empty workspace
    , ("M-h", moveTo Prev nonEmptyWSs)          -- Go to previous non-empty workspace
    , ("M-S-<Tab>", moveTo Prev nonEmptyWSs)
    , ("M-<Left>", moveTo Prev allWSs)          -- Go to previous non-empty workspace
    , ("M-d", moveTo Next emptyWSs)             -- Go to next empty workspace
    , ("M-S-l", shiftTo Next allWSs >> moveTo Next allWSs)  -- Shifts focused window to next workspace
    , ("M-S-h", shiftTo Prev allWSs >> moveTo Prev allWSs)  -- Shifts focused window to previous workspace
    , ("M-S-d", shiftTo Next emptyWSs)          -- Shifts focused window to next empty workspace
    ] where allWSs          = WSIs (return (\ws -> True))
            nonEmptyWSs     = WSIs (return (\ws -> isJust (W.stack ws)))
            emptyWSs        = WSIs (return (\ws -> not (isJust (W.stack ws))))

myRemoveKeys =
    [ ("M-S-c")
    , ("M-<Return>")
    , ("M-b")
    , ("M-n")
    , ("M-m")
    , ("M-w")
    , ("M-e")
    , ("M-r")
    , ("M-S-w")
    ]

------------------------------------------------------------------------
---LAYOUTS
------------------------------------------------------------------------
myLayoutHook = avoidStruts $ mouseResize $ myDefaultLayout
                    where
                        myDefaultLayout = tall ||| grid ||| noBorders full

tall    = renamed [Replace "tall"] $ spacingWithEdge 4 $ ResizableTall 1 (3/100) (1/2) []
grid    = renamed [Replace "grid"] $ spacingWithEdge 4 $ Grid (16/9)
full    = renamed [Replace "full"] $ Full
