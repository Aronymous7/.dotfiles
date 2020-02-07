------------------------------------------------------------------------
---IMPORTS
------------------------------------------------------------------------
    -- Base
import XMonad
import XMonad.Config.Desktop
import Data.Monoid
import Data.Maybe (isJust)
import System.IO (hPutStrLn)
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W

    -- Utilities
import XMonad.Util.Loggers
import XMonad.Util.EZConfig (additionalKeysP, additionalMouseBindings)
import XMonad.Util.Run (runInTerm, spawnPipe)
import XMonad.Util.SpawnOnce

    -- Hooks
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, defaultPP, wrap, pad, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.ManageDocks (avoidStruts, docksStartupHook, manageDocks)
import XMonad.Hooks.ManageHelpers (isFullscreen, isDialog,  doFullFloat, doCenterFloat)
import XMonad.Hooks.Place (placeHook, withGaps, smart)
import XMonad.Hooks.SetWMName

    -- Actions
import XMonad.Actions.Promote
import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown)
import XMonad.Actions.CopyWindow (kill1)
import XMonad.Actions.WindowGo (runOrRaise, raiseMaybe)
import XMonad.Actions.CycleWS (moveTo, shiftTo, WSType(..), shiftNextScreen, shiftPrevScreen)
import XMonad.Actions.MouseResize
import qualified XMonad.Actions.ConstrainedResize as Sqr

    -- Layouts modifiers
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Layout.Renamed (renamed, Rename(CutWordsLeft, Replace))
import XMonad.Layout.WorkspaceDir
import XMonad.Layout.Spacing (spacing)
import XMonad.Layout.NoBorders
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), Toggle(..), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))

    -- Layouts
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.ResizableTile
import XMonad.Layout.IM (withIM, Property(Role))

    -- Prompts
import XMonad.Prompt (defaultXPConfig, XPConfig(..), XPPosition(Top), Direction1D(..))

------------------------------------------------------------------------
---CONFIG
------------------------------------------------------------------------
myFont				= "xft:DejaVu Sans:pixelsize=12"
myModMask			= mod4Mask		-- Sets modkey to super/windows key
myTerminal			= "urxvt"		-- Sets default terminal
myTextEditor		= "vim"			-- Sets default text editor
myBorderWidth		= 1				-- Sets border width for windows
myFocusFollowsMouse	= False
windowCount			= gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

main = do
    -- Launching xmobar.
    xmproc0 <- spawnPipe "xmobar"
    -- the xmonad, ya know...what the WM is named after!
    xmonad $ desktopConfig
        { manageHook = ( isFullscreen --> doFullFloat ) <+> manageHook desktopConfig <+> manageDocks
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = \x -> hPutStrLn xmproc0 x
                        , ppCurrent = xmobarColor "#c3e88d" "" . wrap "[" "]" -- Current workspace in xmobar
                        , ppVisible = xmobarColor "#c3e88d" ""                -- Visible but not current workspace
                        , ppHidden = xmobarColor "#82AAFF" "" . wrap "*" ""   -- Hidden workspaces in xmobar
                        , ppHiddenNoWindows = xmobarColor "#F07178" ""        -- Hidden workspaces (no windows)
                        , ppTitle = xmobarColor "#d0d0d0" "" . shorten 80     -- Title of active window in xmobar
                        , ppSep =  "<fc=#9AEDFE> : </fc>"                     -- Separators in xmobar
                        , ppUrgent = xmobarColor "#C45500" "" . wrap "!" "!"  -- Urgent workspace
                        , ppExtras  = [windowCount]                           -- # of windows current workspace
                        , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
                        }
        , modMask				= myModMask
        , terminal				= myTerminal
        , startupHook			= myStartupHook
        , layoutHook			= myLayoutHook
        , borderWidth			= myBorderWidth
		, focusFollowsMouse		= myFocusFollowsMouse
        , normalBorderColor		= "#292d3e"
        , focusedBorderColor	= "#bbc5ff"
        } `additionalKeysP`         myKeys

------------------------------------------------------------------------
---AUTOSTART
------------------------------------------------------------------------
myStartupHook = do
          setWMName "LG3D"

------------------------------------------------------------------------
---KEYBINDINGS
------------------------------------------------------------------------
myKeys =
    --- Xmonad
        [ ("M-S-r", spawn "xmonad --restart")        -- Restarts xmonad
        , ("M-S-e", io exitSuccess)                  -- Quits xmonad

    --- Windows
        , ("M-S-q", kill1)                           -- Kill the currently focused client

    --- Floating windows
        , ("M-<Delete>", withFocused $ windows . W.sink)  -- Push floating window back to tile.

    --- Windows navigation
        , ("M-i", windows W.focusMaster)             -- Move focus to the master window
        , ("M-j", windows W.focusDown)               -- Move focus to the next window
        , ("M-k", windows W.focusUp)                 -- Move focus to the prev window
        , ("M-S-i", windows W.swapMaster)            -- Swap the focused window and the master window
        , ("M-S-j", windows W.swapDown)              -- Swap the focused window with the next window
        , ("M-S-k", windows W.swapUp)                -- Swap the focused window with the prev window
        , ("M-S-<Tab>", rotSlavesDown)               -- Rotate all windows except master and keep focus in place
        , ("M-C-<Tab>", rotAllDown)                  -- Rotate all the windows in the current stack
        , ("M-<Backspace>", promote)                 -- Moves focused window to master, all others maintain order

    --- Layouts
        , ("M-<Tab>", sendMessage NextLayout)				-- Switch to next layout

        , ("M-C-h", sendMessage Shrink)
        , ("M-C-l", sendMessage Expand)
        , ("M-C-j", sendMessage MirrorShrink)
        , ("M-C-k", sendMessage MirrorExpand)

    --- Workspaces
        , ("M-l", moveTo Next nonEmptyNonNSP)					-- Go to next non-empty workspace
        , ("M-h", moveTo Prev nonEmptyNonNSP)					-- Go to previous non-empty workspace
		, ("M-d", moveTo Next emptyNonNSP)
        , ("M-S-l", shiftTo Next nonNSP >> moveTo Next nonNSP)	-- Shifts focused window to next workspace
        , ("M-S-h", shiftTo Prev nonNSP >> moveTo Prev nonNSP)	-- Shifts focused window to previous workspace
		, ("M-S-d", shiftTo Next emptyNonNSP)

    --- Run Programs
        , ("M-<Return>", spawn myTerminal)
        , ("M-s", spawn "dmenu_run")
        , ("M-b", spawn "firefox")
        , ("M-n", spawn "gsimplecal")
        , ("M-m", spawn "thunderbird")
        ] where nonNSP          = WSIs (return (\ws -> W.tag ws /= "nsp"))
                nonEmptyNonNSP  = WSIs (return (\ws -> isJust (W.stack ws) && W.tag ws /= "nsp"))
                emptyNonNSP		= WSIs (return (\ws -> not (isJust (W.stack ws)) && W.tag ws /= "nsp"))

------------------------------------------------------------------------
---LAYOUTS
------------------------------------------------------------------------

myLayoutHook = avoidStruts $ mouseResize $ windowArrange $
               mkToggle (NBFULL ?? NOBORDERS ?? EOT) $ myDefaultLayout
             where
                 myDefaultLayout = tall ||| grid ||| noBorders monocle


tall	= renamed [Replace "tall"]     $ spacing 6 $ ResizableTall 1 (3/100) (1/2) []
grid	= renamed [Replace "grid"]     $ spacing 6 $ mkToggle (single MIRROR) $ Grid (16/10)
monocle	= renamed [Replace "monocle"]  $ Full
