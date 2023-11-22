local Array = require("Array")

local String = {}

--- @param s string
--- @param start number
--- @param _end number
--- @return string
function String.slice(s, start, _end)
    return string.sub(s, start + 1, _end + 1)
end

--- @param s string
--- @param separator string
--- @return table
function String.split(s, separator)
    local result = {}
    for match in (s .. separator):gmatch("(.-)" .. separator) do
        table.insert(result, match)
    end
    return Array(result)
end

--- @param s string
--- @return string
function String.trim(s)
    return string.match(s, "^%s*(.*%S)") or ""
end

--- @param s string
--- @return string
function String.trimEnd(s)
    return string.match(s, "^%s*(.*)")
end

--- @param s string
--- @return string
function String.trimStart(s)
    return string.match(s, "(.-)%s*$")
end

--- String.repeat(), but 'repeat' is a reserved word
--- @param s string
--- @param n number
--- @return string
function String.rep(s, n)
    return string.rep(s, n)
end

--- @param s string
--- @param search string
--- @param replace string
--- @return string
function String.replace(s, search, replace)
    local result, _ = string.gsub(s, search, replace)
    return result
end

--- @param s string
--- @param length number
--- @param padChar string
--- @return string
function String.padEnd(s, length, padChar)
    local padLength = length - #s
    if padLength > 0 then
        return s .. string.rep(padChar, padLength)
    else
        return s
    end
end

--- @param s string
--- @param length number
--- @param padChar string
--- @return string
function String.padStart(s, length, padChar)
    local padLength = length - #s
    if padLength > 0 then
        return string.rep(padChar, padLength) .. s
    else
        return s
    end
end

--- @param s string
--- @param pattern string
--- @return string | nil
function String.match(s, pattern)
    return string.match(s, pattern) or nil
end

--- @param s string
--- @param substring any
--- @return boolean
function String.includes(s, substring)
    return string.find(s, substring, 1, true) ~= nil
end

--- @param s string
--- @param substring string
--- @param startAt number | nil
--- @return number
function String.indexOf(s, substring, startAt)
    local _, index = string.find(s, substring, (startAt or 0) + 1, true)
    return (index or 0) - 1
end

--- @param s string
--- @param substring string
--- @return number
function String.lastIndexOf(s, substring)
    local index = -1
    local i = 1
    while i <= #s do
        local start = string.find(s, substring, i, true)
        if start then
            i = start
            index = start - 1
        end
        i = i + 1
    end
    return index
end

--- @param s string
--- @return string
function String.toLowerCase(s)
    return string.lower(s)
end

--- @param s string
--- @return string
function String.toUpperCase(s)
    return string.upper(s)
end

--- @param s string
--- @param prefix string
--- @return boolean
function String.startsWith(s, prefix)
    return string.sub(s, 1, #prefix) == prefix
end

--- @param s string
--- @param suffix string
--- @return boolean
function String.endsWith(s, suffix)
    return suffix == "" or string.sub(s, -#suffix) == suffix
end

--- @param s string
--- @param start number
--- @param _end number | nil
--- @return string
function String.substring(s, start, _end)
    return string.sub(s, start + 1, (_end or #s - 1) + 1)
end

--- @param s string
--- @param index number
--- @return string
function String.at(s, index)
    return string.sub(s, index + 1, index + 1)
end

-- ensure not overwriting existing method
for k, v in pairs(String) do
    string[k] = string[k] or v
end

--- @param s string
--- @return any
return function(s)
    assert(type(s) == "string", "String constructor requires string argument")
    return s
end
