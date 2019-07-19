---------------------------------------------------------------
-- Author: DWV aka Twily                                  2013
-- Awesome -v 3.5
---------------------------------------------------------------
-- Grab environment
local tonumber = tonumber
local beautiful = beautiful
local awful = awful
local math = math

module("layouts.twily")

name = "twily"


bottom_left = 0
bottom_right = 1

function arrange(p)
    -- Screen
    local wa = p.workarea
    local cls = p.clients

    local border = tonumber(beautiful.border_width)
    --local gap = tonumber(beautiful.useless_gap_width)
    local gap = 19        -- px (pixels normal gap (between windows))
    local fixed_gap = 65  -- px (pixels large gap (top/bottom))

    local main_wid = 73.5 -- % (percent of screen width (main window width))
    local main_hei = 58.6   -- % (percent of screen height (main window height))

    if #cls > 0 then
        -- Center window
        local c = cls[#cls]
        local g = {}
        local mainwid = math.floor((main_wid * wa.width) / 100)
        local mainhei = math.floor((main_hei * (wa.height + wa.y)) / 100) + wa.y
        local slavewid = math.floor((mainwid / 2) - (gap / 2)) - border
        local slavehei = math.floor(wa.height - mainhei - (fixed_gap * 2) - gap - (border * 4))

        g.width = mainwid
        g.height = mainhei
        g.x = math.floor(wa.width / 2 - (mainwid / 2)) - border
        g.y = wa.y + fixed_gap

        --g.width = g.width + (fixed_gap * 2)
        --g.x = g.x - fixed_gap

        c:geometry(g)

        -- Auxiliary windows
        if #cls > 1 then
            local at = 0
            for i = (#cls - 1),1,-1 do
                if at == 3 then
                    break
                end

                c = cls[i]
                g = {}

                local cw_scale = 20

                if at == bottom_left then
                    --g.x = math.floor((wa.width / 2) - (slavewid + border) - gap + (gap / 2)) - border - 1
                    g.x = math.floor(wa.width - ((main_wid * wa.width) / 100) - ((((100 - main_wid) * wa.width) / 100) / 2)) - border
                    g.width = slavewid
                elseif at == bottom_right then
                    --g.x = math.floor((wa.width / 2) + border + gap - (gap / 2)) - border
                    g.x = math.floor(wa.width - ((((100 - main_wid) * wa.width) / 100) / 2) - slavewid) - border
                    g.width = slavewid
                end

                g.height = slavehei

                g.y = math.floor(wa.y + fixed_gap + gap + mainhei + (border * 2))

                c:geometry(g)

                at = at + 1
            end

            -- Set remaining client to floating
            for i = (#cls - 1 - 2),1,-1 do
                c = cls[i]
                awful.client.floating.set(c, true)
            end
        end
    end
end
