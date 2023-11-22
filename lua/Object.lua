local Array = require("Array")

local Object = {}

--- @param object table
--- @return Array
function Object.keys(object)
    local t = {}
    for key, _ in pairs(object) do
        table.insert(t, key)
    end
    return Array(t)
end

--- @param object table
--- @return Array
function Object.values(object)
    local t = {}
    for _, value in pairs(object) do
        table.insert(t, value)
    end
    return Array(t)
end

--- @param object table
--- @return Array
function Object.entries(object)
    local t = {}
    for key, value in pairs(object) do
        table.insert(t, Array({key, value}))
    end
    return Array(t)
end

--- @param entries table
--- @return Array
function Object.fromEntries(entries)
    local t = {}
    for _, value in pairs(entries) do
        t[value[1]] = value[2]
    end
    return t
end

return Object
