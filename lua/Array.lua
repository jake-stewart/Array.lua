local Array = {}

local function clampWrapIndex(n, max)
    if n <= 0 then n = max + n end
    return math.min(math.max(1, n), max)
end

---@param table table
---@param start number | nil
---@param _end number | nil
---@return number, number
local function range(table, start, _end)
    return clampWrapIndex(start and start + 1 or 1, #table),
        clampWrapIndex(_end and _end + 1 or #table, #table)
end

local unpack = table.unpack or unpack

---@param t table
function Array.unpack(t)
    return unpack(t)
end

---Combines two or more arrays. This method returns a new array without modifying any existing arrays.
---@param t table
---@param index number
function Array.at(t, index)
    if index then
        if index < 0 then
            index = #t + index
        end
        local item = t[index + 1]
        if type(item) == "table" then
            return Array(item)
        end
        return item;
    end
    return nil
end

---Appends new elements to the end of an array, and returns the length of the array.
---@param t table
---@param ... any
---@return number
function Array.push(t, ...)
    for _, value in ipairs({...}) do
        table.insert(t, value)
    end
    return #t
end

---Removes the last element from an array and returns it.
---If the array is empty, nil is returned and the array is not modified.
---@param t table
---@return any
function Array.pop(t)
    return table.remove(t, #t)
end

---Removes the first element from an array and returns it.
---If the array is empty, nil is returned and the array is not modified.
---@param t table
---@return any
function Array.shift(t)
    return table.remove(t, 1)
end

---Inserts new elements at the start of an array, and returns the new length of the array.
---@param t table
---@param ... any
---@return number
function Array.unshift(t, ...)
    for _, value in ... do
        table.insert(t.value, 1, value)
    end
    return #t
end

---Returns a copy of a section of an array.
---For both start and end, a negative index can be used to indicate an offset from the end of the array.
---For example, -2 refers to the second to last element of the array.
---@param t table
---@return table
function Array.slice(t, start, _end)
    start, _end = range(t, start, _end)
    local slice = {}
    for i = start, _end do
        table.insert(slice, t[i])
    end
    return slice
end

---Removes elements from an array and, if necessary, inserts new elements in their place, returning the deleted elements.
---@param t table
---@param start number
---@param deleteCount number | nil
---@return table
function Array.splice(t, start, deleteCount)
    start = clampWrapIndex(start + 1, #t)
    deleteCount = math.min(#t - start + 1, deleteCount or #t - start + 1)
    local splice = {}
    for _ = 1, deleteCount do
        table.insert(splice, table.remove(t, start))
    end
    return splice
end

---This method mutates the array and returns a reference to the same array.
---@param t table
---@return table
function Array.reverse(t)
    local start = 1
    local stop = #t
    while start < stop do
        t[start], t[stop] =
            t[stop], t[start]
        start = start + 1
        stop = stop - 1
    end
    return t
end

---Sorts an array in place.
---This method mutates the array and returns a reference to the same array.
---@param t table
---@param comp? fun(a: any, b: any): boolean
---@return table
function Array.sort(t, comp)
    table.sort(t, comp);
    return t
end

---@param t table
---@param callback fun(value: any, key: number): nil
---@return nil
function Array.forEach(t, callback)
    for key, value in ipairs(t) do
        callback(value, key - 1)
    end
end

---@param t table
---@param callback fun(value: any, key: number): nil
---@return table
function Array.map(t, callback)
    local table = {}
    for key, value in ipairs(t) do
        table[key] = callback(value, key - 1)
    end
    return table
end

---@param t table
---@param callback fun(value: any, key: number): nil
---@return table
function Array.filter(t, callback)
    local filtered = {}
    for key, value in ipairs(t) do
        if callback(value, key - 1) then
            table.insert(filtered, value)
        end
    end
    return filtered
end

---Returns the index of the first occurrence of a value in an array, or -1 if it is not present.
---@param t table
---@param searchElement any
---@param fromIndex number | nil
---@return number
function Array.indexOf(t, searchElement, fromIndex)
    for i = fromIndex and fromIndex + 1 or 1, #t do
        if t[i] == searchElement then
            return i - 1
        end
    end
    return -1
end

---Returns the index of the last occurrence of a specified value in an array, or -1 if it is not present.
---@param t table
---@param searchElement any
---@param fromIndex number | nil
---@return number
function Array.lastIndexOf(t, searchElement, fromIndex)
    for i = fromIndex and fromIndex + 1 or #t, 1, -1 do
        if t[i] == searchElement then
            return i - 1
        end
    end
    return -1
end

---@param searchElement any
---@param t table
---@return boolean
function Array.includes(t, searchElement)
    for _, value in ipairs(t) do
        if value == searchElement then
            return true
        end
    end
    return false
end

---Calls the specified callback function for all the elements in an array.
---The return value of the callback function is the accumulated result, and is provided as an argument in the next call to the callback function.
---@param t table
---@param callback fun(current: any, total: any, idx: number): nil
---@param initial any
---@return any
function Array.reduce(t, callback, initial)
    for key, value in ipairs(t) do
        initial = callback(initial, value, key - 1)
    end
    return initial
end

---Calls the specified callback function for all the elements in an array, in descending order. The return value of the callback function is the accumulated result, and is provided as an argument in the next call to the callback function.
---@param t table
---@param callback fun(current: any, total: any, idx: number): nil
---@param initial any
---@return any
function Array.reduceRight(t, callback, initial)
    for i = #t, 1, -1 do
        initial = callback(initial, t[i], i - 1)
    end
    return initial
end

---Returns the value of the first element in the array where predicate is true, and undefined otherwise.
---@param t table
---@param predicate fun(value: any, index: number): boolean
---@return any
function Array.find(t, predicate)
    for key, value in ipairs(t) do
        if predicate(value, key - 1) then
            return value
        end
    end
    return nil
end

---Returns the index of the first element in the array where predicate is true, and -1 otherwise.
---@param t table
---@param predicate fun(value: any, index: number): boolean
---@return number
function Array.findIndex(t, predicate)
    for key, value in ipairs(t) do
        if predicate(value, key - 1) then
            return key - 1
        end
    end
    return -1
end

---Combines two or more arrays. This method returns a new array without modifying any existing arrays.
---@param t table
---@param ... any
---@return table
function Array.concat(t, ...)
    local concatenated = {}
    for _, value in ipairs(t) do
        table.insert(concatenated, value)
    end
    for _, array in ipairs(...) do
        for _, value in ipairs(array) do
            table.insert(concatenated, value)
        end
    end
    return concatenated
end

---Adds all the elements of an array into a string, separated by the specified separator string.
---@param t table
---@param sep string | nil # A string used to separate one element of the array from the next in the resulting string. If omitted, the array elements are separated with a comma.
---@return string
function Array.join(t, sep)
    sep = sep or ","
    return table.concat(t, sep)
end

---Changes all array elements from start to _end index to a static value and returns the modified array.
---@param t table
---@param value any
---@param start number | nil # index to start filling the array at. If start is negative, it is treated as length+start where length is the length of the array.
---@param _end number | nil # index to stop filling the array at. If end is negative, it is treated as length+end.
---@return table
function Array.fill(t, value, start, _end)
    start, _end = range(t, start, _end)
    for i = start, _end do
        t[i] = value
    end
    return t
end

---Determines whether all the members of an array satisfy the specified test.
---@param t table
---@param predicate fun(value: any, index: number): boolean
---@return boolean
function Array.every(t, predicate)
    for key, value in ipairs(t) do
        if not predicate(value, key - 1) then
            return false
        end
    end
    return true
end

---Determines whether the specified callback function returns true for any element of an array.
---@param t table
---@param predicate fun(value: any, index: number): boolean
---@return boolean
function Array.some(t, predicate)
    for key, value in ipairs(t) do
        if predicate(value, key - 1) then
            return true
        end
    end
    return false
end

---@param t table
---@param target number
---@param start number
---@param _end number | nil
function Array.copyWithin(t, target, start, _end)
    target = clampWrapIndex(target + 1, #t)
    start, _end = range(t, start, _end)
    local count = math.min(_end - start, #t - target)
    for i = 0, count do
        t[target + i] = t[start + i]
    end
end

Array.__index = Array

-- iterator, call using `for i, v in array`
function Array.__call(t, _, i)
    i = (i or -1) + 1
    local item = t[i + 1]
    if item then
        return i, item
    end
end

return setmetatable(Array, {
    __call = function(_, t)
        assert(type(t) == "table", "Array constructor requires table argument")
        return setmetatable(t, Array)
    end
})
