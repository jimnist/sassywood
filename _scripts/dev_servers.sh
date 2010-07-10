#!/bin/sh

# run development server for jekyll and compass

if [ $# -ne 1 ]; then
    PATHDIR=`pwd`
else
    PATHDIR=$1
fi

/usr/bin/osascript <<EOF
activate application "Terminal"
tell application "System Events"
    keystroke "t" using {command down}
end tell
tell application "Terminal"
    repeat with win in windows
        try
            if get frontmost of win is true then
                do script "cd $PATHDIR" in (selected tab of win)
                do script "clear" in (selected tab of win)
                do script "jekyll --auto --server" in (selected tab of win)
            end if
        end try
    end repeat
end tell
tell application "System Events"
    keystroke "t" using {command down}
end tell
tell application "Terminal"
    repeat with win in windows
        try
            if get frontmost of win is true then
                do script "cd $PATHDIR" in (selected tab of win)
                do script "compass watch" in (selected tab of win)
            end if
        end try
    end repeat
end tell
EOF
clear
