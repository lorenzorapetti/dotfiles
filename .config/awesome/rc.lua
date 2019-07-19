-- [[
--
--      AWESOME WM CONFIG by DWV aka Twily | 2013 - 2014 | AWESOME -V 3.5
--
-- ]]

gears           = require("gears")
awful           = require("awful")
awful.rules     = require("awful.rules")
awful.autofoxus = require("awful.autofocus")
vicious         = require("vicious")
wibox           = require("wibox")
beautiful       = require("beautiful")
naughty         = require("naughty")
menubar         = require("menubar")

layouts         = require("layouts")
center          = require("wibox.center")


-- Run Once
function run_once(cmd)
        findme = cmd
        firstspace = cmd:find(" ")
        if firstspace then
                findme = cmd:sub(0, firstspace-1)
        end
        awful.util.spawn_with_shell("pgrep -u $USER -c " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

run_once("compton --config /home/twily/.compton/compton.conf -b")
run_once("echo 'Welcome back Twily!' | dzen2 -w 250 -h 25 -x 1660 -y 24 -fn 'Lemon' -p 2")
--run_once("urxvt -g 100x25")


local oldspawn = awful.util.spawn
awful.util.spawn = function (s)
    oldspawn(s, false)
end


-- Error handling
if awesome.startup_errors then
        naughty.notify({
                preset = naughty.config.presets.critical,
                title = "Oops, there where errors during startup!",
                text = awesome.startup_errors
        })
end

-- Handle runtime errors
do
        in_error = false
        awesome.connect_signal("debug::error", function (err)
                -- Avoid endless loop
                if in_error then return end
                in_error = true

                naughty.notify({
                        preset = naughty.config.presets.critical,
                        title = "Oops, an error happened!",
                        text = err
                })
                in_error = false
        end)
end


-- Variable Definition
home            = os.getenv("HOME")
config_dir         = home .. "/.config/awesome"

beautiful.init(config_dir .. "/theme/theme.lua")

terminal        = "urxvt"
editor          = "vim"
editor_cmd      = terminal .. " -g 100x25 -e " .. editor
gui_editor      = "leafpad"
browser         = "firefox-nightly"
tasks           = terminal .. " -g 100x25 -e htop"
volctrl         = "Master"

modkey          = "Mod4"
altkey          = "Mod1"


-- Layout Table
local layouts = {
        awful.layout.suit.floating,
        layouts.uselesstile,
        --awful.layout.suit.tile,
        layouts.twily
}


-- Wallpaper
--if beautiful.wallpaper then
--        for s = 1, screen.count() do
--                gears.wallpaper.maximized(beautiful.wallpaper, s, true)
--        end
--end


-- Tags
tags = {
        --names = { "/main/", "/media/", "/code/", "/misc/" },
        names = { " ▫ ", " ▣ ", " ▦ ", " ▩ ", " ▪ " },
        --layout = { layouts[3], layouts[2], layouts[2], layouts[2], layouts[2] }
        layout = { layouts[1], layouts[1], layouts[1], layouts[1], layouts[1] }
}
for s = 1, screen.count() do
        tags[s] = awful.tag(tags.names, s, tags.layout)
end


--menu_sep=""
menu_sep="--------------"

-- Menu
myaccessories = {
        { "7-Zip", "7zFM" },
        { "Calculator", "galculator" },
        { "Leafpad", gui_editor },
        { "Thunar", "thunar" }
}
myinternet = {
        { "Nightly", browser },
        { "Thunderbird", "thunderbird" },
        { menu_sep, "" },
        --{ "transmission", "transmission-gtk" },
        { "FileZilla", "filezilla" },
        { "Irrsi", terminal .. " -g 100x25 -e irssi" },
        { "rTorrent", terminal .. " -g 100x25 -e rtorrent" },
        { "Wicd", terminal .. " -g 100x25 -e wicd-curses" }
}
mymedia = {
        { "Ncmpcpp", terminal .. " -g 100x25 -e ncmpcpp" },
        { "Spotify", "spotify" },
        { "VLC", "vlc" },
        { menu_sep, "" },
        { "Volume", terminal .. " -g 100x25 -e alsamixer" }
}
mygames = {
        { "ArmagetronAd", "armagetronad" },
        { "Minecraft", "sh /home/twily/games/minecraft" },
        { "NetHack", terminal .. " -g 100x25 -e nethack" },
        { "Stone-Soup", terminal .. " -g 100x25 -e crawl" }
}
mygraphics = {
        { "Colors", "gcolor2" },
        { "Gimp", "gimp" },
        { menu_sep, "" },
        { "Feh", "feh /home/twily/pictures/" },
        { "Sxiv", "sxiv -tsr /home/twily/pictures" }
}
myoffice = {
        { "Libre Base", "libreoffice --base" },
        { "Libre Calc", "libreoffice --calc" },
        { "Libre Draw", "libreoffice --draw" },
        { "Libre Impress", "libreoffice --impress" },
        { "Libre Math", "libreoffice --math" },
        { "Libre Writer", "libreoffice --writer" }
}
mysystem = {
        --{ "GTK-Theme", "gtk-chtheme" }, 
        { "GTK-Theme", "lxappearance" },
        { "Lock Screen", "/home/twily/.lockscreen" },
        { "Process Viewer", tasks },
        { menu_sep, "" },
        { "Logout", "killall awesome" },
        { "Reboot", "reboot" },
        { "Shutdown", "poweroff" },
        { menu_sep, "" },
        { "Performance", "sh /home/twily/scripts/compton game" },
        { "Quality", "sh /home/twily/scripts/compton" }
}
mymainmenu = awful.menu({
        items = {
                { "Ranger", terminal .. " -g 100x25 -e ranger" },
                { "Terminal", terminal .. " -g 100x25" },
                { menu_sep, "" },
                { "Accessories", myaccessories },
                { "Games", mygames },
                { "Graphics", mygraphics },
                { "Internet", myinternet },
                { "Media", mymedia },
                { "Office", myoffice },
                { "System", mysystem }
        }
})
mylauncher = awful.widget.launcher({
        image = beautiful.awesome_icon,
        menu = mymainmenu
})


-- WIBOX

-- Kernel Info
syswidget = wibox.widget.textbox()
vicious.register( syswidget, vicious.widgets.os, "<span color=\"#D3D5E0\">$2</span>" )

-- Uptime
uptimewidget = wibox.widget.textbox()
vicious.register( uptimewidget, vicious.widgets.uptime, "<span color=\"#d6ccdc\">Up</span> <span color=\"#D3D5E0\">$2.$3</span>" )

-- Cpu
cpuwidget = wibox.widget.textbox()
vicious.register( cpuwidget, vicious.widgets.cpu, "<span color=\"#d6ccdc\">Cpu</span> <span color=\"#D3D5E0\">$1%</span>", 3 )

-- Ram
memwidget = wibox.widget.textbox()
vicious.register( memwidget, vicious.widgets.mem, "<span color=\"#d6ccdc\">Mem</span> <span color=\"#D3D5E0\">$2MiB</span>", 5 )

-- Clock
mytextclock = awful.widget.textclock("<span color=\"#aaa5ad\">⮖</span> <span color=\"#d6ccdc\">%a, %d %b %H:%M</span> " )
mytextclock:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.util.spawn("sh " .. config_dir .. "/dzen/dzen-cal") end)
))

-- Mpd
mpdwidget = wibox.widget.textbox()
vicious.register( mpdwidget, vicious.widgets.mpd, function(widget, args)
    if args["{state}"] == "Stop" then
        return ""
    else
        return '<span color="#aaa5ad">⮕</span> <span color="#d6ccdc">'..args["{Artist}"]..' - '..args["{Title}"]..'</span>'
    end
end, 1)

-- Volume
volumewidget = wibox.widget.textbox()
vicious.register(volumewidget, vicious.widgets.volume, function(volumewidget, args)
    local volbar = ""
    local volico = "<span color='#aaa5ad'>"
    local vol = math.floor(args[1] / 10)

    volbar = "<span color='".."#d6ccdc".."'>"..
        string.rep("⮶",vol)..
        "</span><span color='".."#4b464f".."'>"..
        string.rep("⮶",10-vol).."</span>"

    if args[2] == "♩" then
        volico = volico.."⮝"
    else
        if args[1] > 20 then
            volico = volico.."⮞"
        else
            volico = volico.."⮟"
        end
    end
    volico = volico.."</span>"

    return volico..' '..volbar
end, 1, volctrl )
volumewidget:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.util.spawn("sh " .. config_dir .. "/dzen/dzen-vol") end)
))

-- Battery
batwidget = wibox.widget.textbox()
vicious.register(batwidget, vicious.widgets.bat, function (batwidget, args)
    local batbar = ""
    local batico = "<span color='#aaa5ad'>"
    local bat = math.floor(args[2] / 10)

    batbar = "<span color='".."#d6ccdc".."'>"..
        string.rep("⮶",bat)..
        "</span><span color='".."#4b464f".."'>"..
        string.rep("⮶",10-bat).."</span>"

    if args[1] == "↯" then
        batico = batico.."⮎"
    elseif args[1] == "+" then
        batico = batico.."⮒"
    elseif args[1] == "-" then
        if args[2] > 60 then
            batico = batico.."⮏"
        elseif args[2] > 10 then
            batico = batico.."⮑"
        else
            batico = batico.."⮐"
        end
    end
    batico = batico.."</span>"

    return batico..' '..batbar
end, 5, "BAT0" )
batwidget:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.util.spawn("sh " .. config_dir .. "/dzen/dzen-bat") end)
))

-- Spacer
space = wibox.widget.textbox()
space:set_text(' ')

-- Sepearator
sepa = wibox.widget.textbox()
sepa:set_text('   ')

separator = wibox.widget.imagebox()
separator:set_image(awful.util.getdir("config") .. "/theme/separator.png")

-- Create MyTaskbox
mytaskbox = {}
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
        awful.button({ }, 1, function (c)
                if c == client.focus then
                        c.minimized = true
                else
                        c.minimized = false
                        if not c:isvisible() then
                                awful.tag.viewonly(c:tags()[1])
                        end
                        client.focus = c
                        c:raise()
                end
        end),
        awful.button({ }, 3, function ()
                if instance then
                        instance:hide()
                        instance = nil
                else
                        instance = awful.menu.clients({ width = 250 })
                end
        end),
        awful.button({ }, 5, function ()
                awful.client.focus.byidx(-1)
                if client.focus then client.focus:raise() end
        end)
)

for s = 1, screen.count() do
        mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)
        
        mytaskbox[s] = awful.wibox({ position = "bottom", height = "14", screen = s })
        mytaskbox[s].visible = not mytaskbox[s].visible


        local layout = wibox.layout.align.horizontal()
        layout:set_left(mytasklist[s])
        layout:set_right(syswidget)

        mytaskbox[s]:set_widget(layout)
    end



-- Create Wibox
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
        awful.button({ }, 1, awful.tag.viewonly),
        awful.button({ modkey }, 1, awful.client.movetotag),
        awful.button({ }, 3, awful.tag.viewtoggle),
        awful.button({ modkey }, 3, awful.client.toggletag),
        awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
        awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
)

for s = 1, screen.count() do
        mypromptbox[s] = awful.widget.prompt()

        mylayoutbox[s] = awful.widget.layoutbox(s)
        mylayoutbox[s]:buttons(awful.util.table.join(
                awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)
        ))
        mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)


        mywibox[s] = awful.wibox({ position = "top", height = "14", screen = s })

        -- Widgets to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(mytaglist[s])
        left_layout:add(sepa)
        left_layout:add(mylauncher)
        left_layout:add(mypromptbox[s])
        left_layout:add(sepa)

        -- Widgets to the right
        local right_layout = wibox.layout.fixed.horizontal()
        --if s == 1 then right_layout:add(wibox.widget.systray()) end
    
        --right_layout:add(space)
        --right_layout:add(mpdwidget)
        --right_layout:add(sepa)
        --right_layout:add(syswidget)
        --right_layout:add(sepa)
        --right_layout:add(separator)
        --right_layout:add(sepa)
        right_layout:add(volumewidget)
        right_layout:add(sepa)
        --right_layout:add(space)
        right_layout:add(batwidget)
        --right_layout:add(sepa)
        --right_layout:add(mytextclock)
        right_layout:add(space)
        --right_layout:add(mylayoutbox[s])


        local layout = center.horizontal()
        layout:set_first(left_layout)
        --layout:set_middle(mytasklist[s])
        layout:set_second(mytextclock)
        layout:set_third(right_layout)

        mywibox[s]:set_widget(layout)
    end


    -- Mouse Bindings
    root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
    ))


    -- Key Bindings
    globalkeys = awful.util.table.join(

    -- Capture Screenshot
    --awful.key({ }, "Print", function () awful.util.spawn("scrot -e 'mv $f /home/twily/div/screenshots/ 2>/dev/null'") end),
    awful.key({ }, "Print", function () awful.util.spawn("sh /home/twily/scripts/takeshot 1.5") end),


    -- Move Clients
    awful.key({ altkey }, "Next",   function () awful.client.moveresize(  1,  1, -2, -2) end),
    awful.key({ altkey }, "Prior",  function () awful.client.moveresize( -1, -1,  2,  2) end),
    awful.key({ altkey }, "Down",   function () awful.client.moveresize(  0,  1,  0,  0) end),
    awful.key({ altkey }, "Up",     function () awful.client.moveresize(  0, -1,  0,  0) end),
    awful.key({ altkey }, "Left",   function () awful.client.moveresize( -1,  0,  0,  0) end),
    awful.key({ altkey }, "Right",  function () awful.client.moveresize(  1,  0,  0,  0) end),
    awful.key({ modkey,             }, "Left",      awful.tag.viewprev       ),
    awful.key({ modkey,             }, "Right",     awful.tag.viewnext       ),
    awful.key({ modkey,             }, "Escape",    awful.tag.history.restore),
    awful.key({ modkey,             }, "k",
    function ()
        awful.client.focus.byidx( 1)
        if client.focus then client.focus:raise() end
    end),
    awful.key({ modkey,             }, "j",
    function ()
        awful.client.focus.byidx(-1)
        if client.focus then client.focus:raise() end
    end),
    awful.key({ modkey,             }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Show/Hide Wibox
    awful.key({ modkey, "Control" }, "b", function ()
        mywibox[mouse.screen].visible = not mywibox[mouse.screen].visible
    end),
    awful.key({ modkey }, "b", function ()
        mytaskbox[mouse.screen].visible = not mytaskbox[mouse.screen].visible
    end),


    -- Application switcher
    awful.key({ altkey }, "Tab", function ()
        -- If you want menu position set coords
        awful.menu.menu_keys.down = { "Down", "Alt_L" }
        local cmenu = awful.menu.clients({width=245}, { keygrabber=true, coords={x=525, y=330} })
    end),


    -- Layout manipulation
    awful.key({ modkey, "Shift"     }, "j", function () awful.client.swap.byidx(  1)        end),
    awful.key({ modkey, "Shift"     }, "k", function () awful.client.swap.byidx( -1)        end),
    awful.key({ modkey, "Control"   }, "j", function () awful.screen.focus_relative(  1)    end),
    awful.key({ modkey, "Control"   }, "k", function () awful.screen.focus_relative( -1)    end),
    awful.key({ modkey              }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,             }, "Tab",
    function ()
        awful.client.focus.history.previous()
        if client.focus then
            client.focus:raise()
        end
    end),

    -- Standard program
    awful.key({ modkey,             }, "Return", function () awful.util.spawn(terminal .. " -g 100x25") end),
    awful.key({ modkey, "Control"   }, "r", awesome.restart),
    awful.key({ modkey, "Shift"     }, "q", awesome.quit),
    awful.key({ modkey,             }, "l",         function () awful.tag.incmwfact( 0.05)          end),
    awful.key({ modkey,             }, "h",         function () awful.tag.incmwfact(-0.05)          end),
    awful.key({ modkey, "Shift"     }, "h",         function () awful.tag.incnmaster( 1)            end),
    awful.key({ modkey, "Shift"     }, "l",         function () awful.tag.incnmaster(-1)            end),
    awful.key({ modkey, "Control"   }, "h",         function () awful.tag.incncol( 1)               end),
    awful.key({ modkey, "Control"   }, "l",         function () awful.tag.incncol(-1)               end),
    awful.key({ modkey,             }, "space",     function () awful.layout.inc(layouts,  1)       end),
    awful.key({ modkey, "Shift"     }, "space",     function () awful.layout.inc(layouts, -1)       end),
    awful.key({ modkey, "Cotrol"    }, "n", awful.client.restore),

    -- Dropdown terminal
    -- awful.key({ modkey,          }, "z",         function () scratch.drop(terminal), end),

    -- Widget popups
    -- awful.key({ altkey,             }, "c",         function () add_calendar(7) end),

    -- Volume Control
    awful.key({ "Control" }, "Up", function ()
        awful.util.spawn("amixer set " .. volctrl .. " playback 3%+", false )
        vicious.force({ volumewidget })
    end),
    awful.key({ "Control" }, "Down", function ()
        awful.util.spawn("amixer set " .. volctrl .. " playback 3%-", false )
        vicious.force({ volumewidget })
    end),
    awful.key({ "Control" }, "m", function ()
        awful.util.spawn("amixer set " .. volctrl .. " playback mute", false )
        vicious.force({ volumewidget })
    end),
    awful.key({ "Control" }, "u", function ()
        awful.util.spawn("amixer set " .. volctrl .. " playback unmute", false )
        vicious.force({ volumewidget })
    end),

    -- Copy to clipboard
    awful.key({ modkey,             }, "c",         function () os.execute("xsel -p -o | xsel -i -b") end),

    -- User programs
    awful.key({ "Control", altkey }, "n",         function () awful.util.spawn( "firefox-nightly", false) end),
    awful.key({ "Control", altkey }, "f",         function () awful.util.spawn( terminal .. " -g 100x25 -e ranger", false ) end),
    awful.key({ "Control", altkey }, "l",         function () awful.util.spawn( "/home/twily/.lockscreen", false) end),

    -- Prompt
    awful.key({ modkey }, "r", function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
    function ()
        awful.prompt.run({ prompt = "Run Lua code: " },
        mypromptbox[mouse.screen].widget,
        awful.util.eval, nil,
        awful.util.getdir("cache") .. "/history_eval")
    end)
    )

    clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
    function (c)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus.
        c.minimized = true
    end),
    awful.key({ modkey,           }, "m",
    function (c)
        c.maximized_horizontal = not c.maximized_horizontal
        c.maximized_vertical   = not c.maximized_vertical

        -- Patch :: No border on Maximized windows
        --[[if c.maximized_horizontal and c.maximized_vertical then
            c.border_width = "0"
            local w_area = screen[ c.screen ].workarea
            c:geometry( { width = w_area.width } )
        else
            c.border_width = beautiful.border_width
        end]]--
    end)
    )



    -- Bind all key numbers to tags.
    -- Be careful: we use keycodes to make it works on any keyboard layout.
    -- This should map on the top row of your keyboard, usually 1 to 9.
    for i = 1, 9 do
        globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
        function ()
            local screen = mouse.screen
            local tag = awful.tag.gettags(screen)[i]
            if tag then
                awful.tag.viewonly(tag)
            end
        end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
        function ()
            local screen = mouse.screen
            local tag = awful.tag.gettags(screen)[i]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
        function ()
            local tag = awful.tag.gettags(client.focus.screen)[i]
            if client.focus and tag then
                awful.client.movetotag(tag)
            end
        end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
        function ()
            local tag = awful.tag.gettags(client.focus.screen)[i]
            if client.focus and tag then
                awful.client.toggletag(tag)
            end
        end))
    end

    clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))


    -- Set keys
    root.keys(globalkeys)


    --  Rules
    awful.rules.rules = {
        -- All clients will match this rule.
        { rule = { },
        properties = { border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            keys = clientkeys,
            buttons = clientbuttons,
            size_hints_honor = false } },
        --{ rule = { class = "MPlayer" },
        --  properties = { floating = true } },
        { rule = { class = "Gimp" },
            properties = { floating = true } },
        { rule = { class = "Galculator" },
            properties = { floating = true } },
        { rule = { class = "Plugin-container" },
            properties = { floating = true } }
        -- Set Firefox to always map on tags number 2 of screen 1.
        -- { rule = { class = "Firefox" },
        --   properties = { tag = tags[1][2] } },
}


--  Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)


