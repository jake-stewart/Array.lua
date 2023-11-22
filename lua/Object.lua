local Array = require("Array")

local Object = {}

--- @param object table
--- @return table
function Object.keys(object)
    local t = {}
    for key, _ in pairs(object) do
        table.insert(t, key)
    end
    return Array(t)
end

--- @param object table
--- @return table
function Object.values(object)
    local t = {}
    for _, value in pairs(object) do
        table.insert(t, value)
    end
    return Array(t)
end

--- @param object table
--- @return table
function Object.entries(object)
    local t = {}
    for key, value in pairs(object) do
        table.insert(t, {key, value})
    end
    return Array(t)
end

--- @param entries table
--- @return table
function Object.fromEntries(entries)
    local t = {}
    for key, value in pairs(entries) do
        t[key] = value
    end
    return t
end

return Object
