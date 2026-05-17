local M = {}

--- @param hex string Hex color value (e.g., 'ff0000' for red, or 'ff000080' for red with 50% opacity)
M.color = function(hex)
  if hex:sub(1, 1) == '#' then
    return hex
  elseif #hex == 8 then
    return 'rgba(' .. hex .. ')'
  else
    return 'rgb(' .. hex .. ')'
  end
end

--- @param color_start string Hex color value for the start of the gradient
--- @param color_end string Hex color value for the end of the gradient
--- @param angle number? Angle of the gradient in degrees (e.g., 0 for left)
M.gradient = function(color_start, color_end, angle)
  return {
    colors = { M.color(color_start), M.color(color_end) },
    angle = angle or 0,
  }
end

return M
