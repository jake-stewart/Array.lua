lua-js
======

i don't like lua.

1. one-based indexing is terrible
2. lacks solid builtins

on the other hand, javascript has a beautiful `Array` api and uses 0-based indexing.

this library implements `Array`, `String`, and `Object` from javascript to make lua usable.

Array
-----

You can pass an `Array` to any lua function expecting a regular `table` and nothing will break.

To achieve interoperability, `__index` and `__pairs` have not been overloaded.
This means that you should use `array:at(0)` instead of `array[1]` and `for i,
v in array` instead of `for i, v in pairs(array)` for 0 based indexing.

### usage
```lua
local Array = require("Array")
local array = Array({"a", "b", "c"})
print(array:at(0)) -- prints "a"

-- prints "0 a", "1 b", "2 c"
for i, v in array do
    print(i, v)
end

```

### supported methods:

 - `at`
 - `push`
 - `pop`
 - `shift`
 - `unshift`
 - `slice`
 - `splice`
 - `reverse`
 - `sort`
 - `forEach`
 - `map`
 - `filter`
 - `indexOf`
 - `lastIndexOf`
 - `includes`
 - `reduce`
 - `reduceRight`
 - `find`
 - `findIndex`
 - `concat`
 - `join`
 - `fill`
 - `every`
 - `some`
 - `copyWithin`
 - `unpack`

String
------

You can pass a `String` to any lua function expecting a regular `string` and nothing will break.

### usage

```lua
local String = require("String")

local string = String("hello world")

print(string:split(" "):at(0)) -- prints "hello"
```

### supported methods:
 - `slice`
 - `split`
 - `trim`
 - `trimEnd`
 - `trimStart`
 - `rep`
 - `replace`
 - `padEnd`
 - `padStart`
 - `match`
 - `includes`
 - `indexOf`
 - `lastIndexOf`
 - `toLowerCase`
 - `toUpperCase`
 - `startsWith`
 - `endsWith`
 - `substring`
 - `at`

the command `match` uses the `table.match`.

Object
------

### usage

```lua
local Object = require("Object")

local object = {
    hello = "world"
}

print(Object.keys({hello = "world"}):at(0)) -- prints "hello"
```

### supported methods:
 - `keys`
 - `values`
 - `entries`
 - `fromEntries`

