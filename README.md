# Defaultable
A "garbage" `Optional` utility that allows returning a default value instead of having to `nil`-coalesce.

Example:
```swift
// OLD

let ny: [UInt8] = [78, 121]
let s = String(bytes: ny, encoding: .ascii)
// returns `String?` even though we're pretty certain we have ascii :/
```
```swift
// NEW

import Defaultable

public extension String: Defaultable {
  static var DV: String { "Default String" } // Best for debug values/etc
}

let ny: [UInt8] = [78, 121]
let s = String(bytes: ny, encoding: .ascii)~
// returns `String`, which will either be "Default String" or the value we expect :3 
```

---

This package also contains some basic Foundation default types that you can utilize instead of having to define them yourself in `DefaultableFoundation`.

An example:
```swift
import Defaultable
import DefaultableFoundation

let ny: [UInt8] = [78, 121]
let s = String(bytes: ny, encoding: .ascii)~
// returns `String`, which will either be "" or the value we expect :3 
```

