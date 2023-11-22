local Array = require("Array")

--- @param start integer
--- @param stop integer | nil
--- @param step integer | nil
--- @return table
--- @overload fun(stop: integer): table
--- @overload fun(start: integer, stop: integer): table
local function range(start, stop, step)
    start, stop = stop and start or 0, stop or start
    step = step or 1
    local t = {}
    for i = start, stop - 1, step do
        table.insert(t, i)
    end
    return Array(t)
end

return range
