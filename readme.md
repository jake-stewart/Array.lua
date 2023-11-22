lua-js
======

i don't like lua.

1. one-based indexing is terrible
2. lacks solid builtins

on the other hand, javascript has a beautiful `Array` api and uses 0-based indexing.

this library implements `Array`, `String`, and `Object` from javascript to make lua usable.

Array
-----

does not override the `__index` method so you can pass arrays to other lua
functions without anything breaking. this means the `[]` operator is 1-based
indexing. use the `Array:at()` method for 0 based indexing.

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

### usage

```lua
local String = require("String")

print(String.split("hello world", " "):at(0)) -- prints "hello"
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

