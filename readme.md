Array.lua
=========

use the javascript Array api in lua and avoid one based indexed lunacy
does not override the `__index` method so you can pass arrays to other lua
functions without anything breaking. if you want to index, use `Array:at()`

also check out [String.lua](https://github.com/jake-stewart/String.lua).

### usage

```lua
local Array = require("Array")

local array = Array({1, 2, 3, 4})
print(array:at(0))  -- prints "1"
print(Array.at(array, 0)) -- also prints "1"
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

also has `unpack`.

