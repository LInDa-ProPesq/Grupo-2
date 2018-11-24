#!/usr/bin/env wish

# Copyright 2018 Siep Kroonenberg

# This file is licensed under the GNU General Public License version 2
# or any later version.

# common declarations for tlshell.tcl and install-tl-gui.tcl

set ::plain_unix 0
if {$::tcl_platform(platform) eq "unix" && $::tcl_platform(os) ne "Darwin"} {
  set ::plain_unix 1
}

# process ID of the perl program that will run in the background
set ::perlpid 0

set any_mirror "http://mirror.ctan.org/systems/texlive/tlnet"

proc get_stacktrace {} {
  set level [info level]
  set s ""
  for {set i 1} {$i < $level} {incr i} {
    append s [format "Level %u: %s\n" $i [info level $i]]
  }
  return $s
} ; # get_stacktrace

# what exit procs do we need?
# - plain error exit with messagebox and stacktrace
# - plain messagebox exit
# - showing log output, maybe with appended message,
#   use log toplevel for lengthy output
# is closing the pipe $::inst guaranteed to kill perl? It should be

proc err_exit {{mess ""}} {
  if {$mess eq ""} {set mess "Error"}
  append mess "\n" [get_stacktrace]
  if $::plain_unix {
    # plain_unix: avoid a RenderBadPicture error on quitting.
    # 'send' changes the shutdown sequence,
    # which avoids triggering the bug.
    # 'tk appname <something>' restores 'send' and avoids the bug
    bind . <Destroy> {
      catch {tk appname appname}
    }
  }
  tk_messageBox -icon error -message $mess
  # kill perl process, just in case
  if $::perlpid {
    catch {
      if {$::tcl_platform(platform) eq "unix"} {
        exec -ignorestderr "kill" $::perlpid
      } else {
        exec -ignorestderr "taskkill" "/pid" $::perlpid
      }
    }
  }
  exit
} ; # err_exit

# localization support
# tcl 8.5 observes LANG on Unix, but is overruled by LC_ALL.
# for 8.5 or on Mac OS, locale setting from within tcl may not work.
# so let the shell wrapper handle a language option by setting LANG
# and unsetting LC_ALL.

# $TEXMFCONFIG/tlmgr/config can have a setting for gui-lang.
# replace with shell script / batchfile which is sourced?

# for windows there is a bundled 8.6 in which locale can be set on-the-fly.
# consult registry for default locale if LANG is not set.
# The wrapper already does this, but here we do it again
# in case e.g. company policy blocked reg.exe.

# check the command-line for a lang parameter
unset -nocomplain lang
set i 0
while {$i < $::argc} {
  set p [lindex $::argv $i]
  incr i
  if {$p eq "-lang" || $p eq "--lang"} {
    if {$i < $::argc} {
      set lang [lindex $::argv $i]
      break
    }
  } elseif {[string range $p 0 5] eq "-lang="} {
    set lang [string range $p 6 end]
    break
  } elseif {[string range $p 0 6] eq "--lang="} {
    set lang [string range $p 7 end]
    break
  }
}
unset i

# first fallback: check config file if available
if {! [info exists lang] || $lang eq ""} {
  foreach tmf {"TEXMFCONFIG" "TEXMFSYSCONFIG"} {
    if [catch {exec kpsewhich -var-value $tmf} d] {
      break; # apparently there is not yet a TL installation
    }
    if [catch {open [file join $d "tlmgr" "config"] r} fid] continue
    while 1 {
      if [catch {chan gets $fid} l] break
      if {[regexp {^gui-lang\s*=\s*(\S+)$} $l m lang]} {
        chan close $fid
        break
      }
    }
    if {[info exists lang] && $lang ne ""} break
  }
}

# second fallback: check environment for LC_ALL, LC_MESSAGES and LANG
if {! [info exists lang] || $lang eq ""} {
  foreach lng {"LC_ALL" "LC_MESSAGES" "LANG"} {
    if {[info exists ::env($lng)] && $::env($lng) ne ""} {
      set lang $::env($lng)
      break
    }
  }
}

# third fallback, windows-only: check registry
if {(! [info exists lang] || $lang eq "") && \
        $::tcl_platform(platform) eq "windows"} {
  if {! [catch {package require registry}]} {
    set regpath [join {HKEY_LOCAL_MACHINE system currentcontrolset \
      control nls language} "\\"]
    if {! [catch {registry get $regpath "Installlanguage"} lcode]} {
      set regpath [join {HKEY_CLASSES_ROOT mime database rfc1766} "\\"]
      if {! [catch {registry get $regpath $lcode} lng]} {
        set l [string first ";" $lng]
        if {$l > 0} {
          incr l -1
          set lng [string range $lng 0 $l]
        }
        set lang $lng
        #tk_messageBox -message "Language $lang in registry found"
      }
    }
  }
}

# load the message catalog
package require msgcat
if {[info exists lang] && $lang ne ""} {
  ::msgcat::mclocale $lang
  #unset lang
}
::msgcat::mcload [file join $::instroot "tlpkg" "translations"]

proc __ {s args} {return [::msgcat::mc $s {*}$args]}

# string representation of booleans
proc yes_no {b} {
  if $b {
    set ans [::msgcat::mc "Yes"]
  } else {
    set ans [::msgcat::mc "No"]
  }
  return $ans
}

if {$::tcl_platform(os) eq "Darwin"} {
  # avoid warnings 'tar: Failed to set default locale'
  set ::env(LC_ALL) "en_US.UTF-8"
}

### fonts ###

# no bold text for messages; `userDefault' indicates priority
option add *Dialog.msg.font TkDefaultFont userDefault

# larger fonts: lfont and bold titlefont
font create lfont {*}[font configure TkDefaultFont]
font configure lfont -size [expr {round(1.2 * [font actual lfont -size])}]
font create bfont {*}[font configure TkDefaultFont]
font configure bfont -weight bold
font create hfont {*}[font configure lfont]
font configure hfont -weight bold
font create titlefont {*}[font configure TkDefaultFont]
font configure titlefont -weight bold \
    -size [expr {round(1.5 * [font actual titlefont -size])}]

## italicized items; not used
#font create it_font {*}[font configure TkDefaultFont]
#font configure it_font -slant italic

# width of '0', as a very rough estimate of average character width
# assume height == width*2
set ::cw [font measure TkTextFont "0"]

# default foreground color and disabled foreground color
# may not be black in e.g. dark color schemes
set blk [ttk::style lookup TButton -foreground]
set gry [ttk::style lookup TButton -foreground disabled]

# 'default' padding

proc ppack {wdg args} { ; # pack command with padding
  pack $wdg {*}$args -padx 3 -pady 3
}

proc pgrid {wdg args} { ; # grid command with padding
  grid $wdg {*}$args -padx 3 -pady 3
}

# unicode symbols as fake checkboxes in ttk::treeview widgets

proc mark_sym {mrk} {
  if $mrk {
    return "\u25A3" ; # 'white square containing black small square'
  } else {
    return "\u25A1" ; # 'white square'
  }
} ; # mark_sym

# for help output
set ::env(NOPERLDOC) 1

##### dialog support #####

# for example code, look at dialog.tcl, part of Tk itself

# global variable for dialog return value, in case the outcome
# must be handled by the caller rather than by the dialog itself

set ::dialog_ans {}

# start new toplevel with settings appropriate for a dialog
proc create_dlg {wnd {p .}} {
  catch {destroy $wnd} ; # no error if it does not exist
  toplevel $wnd -class Dialog
  wm withdraw $wnd
  if [winfo viewable $p] {wm transient $wnd $p}
  if $::plain_unix {wm attributes $wnd -type dialog}
  wm protocol $wnd WM_DELETE_WINDOW {destroy $wnd}
}

# Place a dialog centered wrt its parent.
# If its geometry is somehow not yet available,
# its upperleft corner will be centered.

proc place_dlg {wnd {p "."}} {
  set g [wm geometry $p]
  scan $g "%dx%d+%d+%d" pw ph px py
  set hcenter [expr {$px + $pw / 2}]
  set vcenter [expr {$py + $ph / 2}]
  set g [wm geometry $wnd]
  set wh [winfo reqheight $wnd]
  set ww [winfo reqwidth $wnd]
  set wx [expr {$hcenter - $ww / 2}]
  if {$wx < 0} { set wx 0}
  set wy [expr {$vcenter - $wh / 2}]
  if {$wy < 0} { set wy 0}
  wm geometry $wnd [format "+%d+%d" $wx $wy]
  wm state $wnd normal
  wm attributes $wnd -topmost
  raise $wnd $p
  tkwait visibility $wnd
  focus $wnd
  grab set $wnd
} ; # place_dlg

# place dialog answer in ::dialog_ans, raise parent, close dialog
proc end_dlg {ans wnd} {
  set ::dialog_ans $ans
  set p [winfo parent $wnd]
  if {$p eq ""} {set p "."}
  raise $p
  destroy $wnd
} ; # end_dlg

##### directories #####

# slash flipping
proc forward_slashify {s} {
  regsub -all {\\} $s {/} r
  return $r
}
proc native_slashify {s} {
  if {$::tcl_platform(platform) eq "windows"} {
    regsub -all {/} $s {\\} r
  } else {
    regsub -all {\\} $s {/} r
  }
  return $r
}

# unix: choose_dir replacing native directory browser

if {$::tcl_platform(platform) eq "unix"} {

  # Based on the tcl/tk widget demo.
  # Also for MacOS, because we want to see /usr.
  # For windows, the native browser widget is better.

  ## Code to populate a single directory node
  proc populateTree {tree node} {
    if {[$tree set $node type] ne "directory"} {
      set type [$tree set $node type]
      return
    }
    $tree delete [$tree children $node]
    foreach f [lsort [glob -nocomplain -directory $node *]] {
      set type [file type $f]
      if {$type eq "directory"} {
        $tree insert $node end \
            -id $f -text [file tail $f] -values [list $type]
        # Need at least one child to make this node openable,
        # will be deleted when actually populating this node
        $tree insert $f 0 -text "dummy"
      }
    }
    # Stop this code from rerunning on the current node
    $tree set $node type processedDirectory
  }

  proc choose_dir {initdir {parent .}} {

    create_dlg .browser $parent
    wm title .browser [__ "Browse..."]

    # wallpaper
    pack [ttk::frame .browser.bg -padding 3] -fill both -expand 1
    ## Create the tree and set it up
    pack [ttk::frame .browser.fr0] -in .browser.bg -fill both -expand 1
    set tree [ttk::treeview .browser.tree \
                  -columns {type} -displaycolumns {} -selectmode browse \
                  -yscroll ".browser.vsb set"]
    .browser.tree column 0 -minwidth 500 -stretch 0
    ttk::scrollbar .browser.vsb -orient vertical -command "$tree yview"
    # hor. scrolling does not work, but toplevel and widget are resizable
    $tree heading \#0 -text "/"
    $tree insert {} end -id "/" -text "/" -values [list "directory"]

    populateTree $tree "/"
    bind $tree <<TreeviewOpen>> {
      populateTree %W [%W focus]
    }
    bind $tree <ButtonRelease-1> {
      .browser.tree heading \#0 -text [%W focus]
    }

    ## Arrange the tree and its scrollbar in the toplevel
    # horizontal scrolling does not work.
    # possible solution: very wide treeview in smaller paned window
    # (may as well use pack in the absence of a horizontal scrollbar)
    grid $tree .browser.vsb -sticky nsew -in .browser.fr0
    grid columnconfigure .browser.fr0 0 -weight 1
    grid rowconfigure .browser.fr0 0 -weight 1

    # ok and cancel buttons
    pack [ttk::frame .browser.fr1] -in .browser.bg -fill x -expand 1
    ppack [ttk::button .browser.ok -text [__ "Ok"]] \
        -in .browser.fr1 -side right
    ppack [ttk::button .browser.cancel -text [__ "Cancel"]] \
        -in .browser.fr1 -side right
    .browser.ok configure -command {
      set ::dialog_ans [.browser.tree focus]
      destroy .browser
    }
    .browser.cancel configure -command {
      set ::dialog_ans ""
      destroy .browser
    }
    unset -nocomplain ::dialog_ans

    # navigate tree to $initdir
    set chosenDir {}
    foreach d [file split [file normalize $initdir]] {
      set nextdir [file join $chosenDir $d]
      if [file isdirectory $nextdir] {
        if {! [$tree exists $nextdir]} {
          $tree insert $chosenDir end -id $nextdir \
              -text $d -values [list "directory"]
        }
        populateTree $tree $nextdir
        set chosenDir $nextdir
      } else {
        break
      }
    }
    $tree see $chosenDir
    $tree selection set [list $chosenDir]
    $tree focus $chosenDir
    $tree heading \#0 -text $chosenDir

    place_dlg .browser $parent
    tkwait window .browser
    return $::dialog_ans
  }; # choose_dir

}; # if unix

proc browse4dir {inidir {parent .}} {
  if {$::tcl_platform(platform) eq "unix"} {
    return [choose_dir $inidir $parent]
  } else {
    return [tk_chooseDirectory \
        -initialdir $inidir -title [__ "Select or type"] -parent $parent]
  }
} ; # browse4dir

# browse for a directory and store in entry- or label widget $w
proc dirbrowser2widget {w} {
  set wclass [winfo class $w]
  if {$wclass eq "Entry" || $wclass eq "TEntry"} {
    set is_entry 1
  } elseif {$wclass eq "Label" || $wclass eq "TLabel"} {
    set is_entry 0
  } else {
    err_exit "browse2widget invoked with unsupported widget class $wclass"
  }
  if $is_entry {
    set retval [$w get]
  } else {
    set retval [$w cget -text]
  }
  set retval [browse4dir $retval [winfo parent $w]]
  if {$retval eq ""} {
    return 0
  } else {
    if {$wclass eq "Entry" || $wclass eq "TEntry"} {
      $w delete 0 end
      $w insert 0 $retval
    } else {
      $w configure -text $retval
    }
    return 1
  }
}
