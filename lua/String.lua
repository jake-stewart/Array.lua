local Array = require("Array")

--- @param s string
--- @param start number
--- @param _end number
--- @return string
string.slice = string.slice or function(s, start, _end)
    return string.sub(s, start + 1, _end + 1)
end

--- @param s string
--- @param separator string
--- @return Array
string.split = string.split or function(s, separator)
    local result = {}
    for match in (s .. separator):gmatch("(.-)" .. separator) do
        table.insert(result, match)
    end
    return Array(result)
end

--- @param s string
--- @return string
string.trim = string.trim or function(s)
    return string.match(s, "^%s*(.*%S)") or ""
end

--- @param s string
--- @return string
string.trimEnd = string.trimEnd or function(s)
    return string.match(s, "^%s*(.*)")
end

--- @param s string
--- @return string
string.trimStart = string.trimStart or function(s)
    return string.match(s, "(.-)%s*$")
end

-- --- string.repeat(), but 'repeat' is a reserved word
-- --- @param s string
-- --- @param n number
-- --- @return string
-- string.rep = string.rep or function(s, n)
--     return string.rep(s, n)
-- end

--- @param s string
--- @param search string
--- @param replace string
--- @return string
string.replace = string.replace or function(s, search, replace)
    local result, _ = string.gsub(s, search, replace)
    return result
end

--- @param s string
--- @param length number
--- @param padChar string
--- @return string
string.padEnd = string.padEnd or function(s, length, padChar)
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
string.padStart = string.padStart or function(s, length, padChar)
    local padLength = length - #s
    if padLength > 0 then
        return string.rep(padChar, padLength) .. s
    else
        return s
    end
end

-- --- @param s string
-- --- @param pattern string
-- --- @return string | nil
-- string.match = string.match or function(s, pattern)
--     return string.match(s, pattern) or nil
-- end

--- @param s string
--- @param substring any
--- @return boolean
string.includes = string.includes or function(s, substring)
    return string.find(s, substring, 1, true) ~= nil
end

--- @param s string
--- @param substring string
--- @param startAt number | nil
--- @return number
string.indexOf = string.indexOf or function(s, substring, startAt)
    local _, index = string.find(s, substring, (startAt or 0) + 1, true)
    return (index or 0) - 1
end

--- @param s string
--- @param substring string
--- @return number
string.lastIndexOf = string.lastIndexOf or function(s, substring)
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
string.toLowerCase = string.toLowerCase or function(s)
    return string.lower(s)
end

--- @param s string
--- @return string
string.toUpperCase = string.toUpperCase or function(s)
    return string.upper(s)
end

--- @param s string
--- @param prefix string
--- @return boolean
string.startsWith = string.startsWith or function(s, prefix)
    return string.sub(s, 1, #prefix) == prefix
end

--- @param s string
--- @param suffix string
--- @return boolean
string.endsWith = string.endsWith or function(s, suffix)
    return suffix == "" or string.sub(s, -#suffix) == suffix
end

--- @param s string
--- @param start number
--- @param _end number | nil
--- @return string
string.substring = string.substring or function(s, start, _end)
    return string.sub(s, start + 1, (_end or #s - 1) + 1)
end

--- @param s string
--- @param index number
--- @return string
string.at = string.at or function(s, index)
    return string.sub(s, index + 1, index + 1)
end

--- @param s string
--- @return string
return function(s)
    assert(type(s) == "string", "String constructor requires string argument")
    return s
end
