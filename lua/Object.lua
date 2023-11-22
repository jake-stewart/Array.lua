local Array = require("Array")

--- @param object table
--- @return table
local function keys(object)
    local t = {}
    for key, _ in pairs(object) do
        table.insert(t, key)
    end
    return Array(t)
end

--- @param object table
--- @return table
local function values(object)
    local t = {}
    for _, value in pairs(object) do
        table.insert(t, value)
    end
    return Array(t)
end

--- @param object table
--- @return table
local function _entries(object)
    local t = {}
    for key, value in pairs(object) do
        table.insert(t, {key, value})
    end
    return Array(t)
end

--- @param entries table
--- @return table
local function fromEntries(entries)
    local t = {}
    for key, value in pairs(entries) do
        t[key] = value
    end
    return t
end

return {
    entries = _entries,
    keys = keys,
    values = values,
    fromEntries = fromEntries,
}
