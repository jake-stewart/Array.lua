local Array = require("Array")

--- @param start integer
--- @param stop integer | nil
--- @param step integer | nil
--- @return Array
--- @overload fun(stop: integer): Array
--- @overload fun(start: integer, stop: integer): Array
return function(start, stop, step)
    start, stop = stop and start or 0, stop or start
    step = step or 1
    local t = {}
    for i = start, stop - 1, step do
        table.insert(t, i)
    end
    return Array(t)
end
