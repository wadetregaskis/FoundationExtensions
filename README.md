#  FoundationExtensions

[![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/wadetregaskis/FoundationExtensions.svg)]()
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fwadetregaskis%2FFoundationExtensions%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/wadetregaskis/FoundationExtensions)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fwadetregaskis%2FFoundationExtensions%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/wadetregaskis/FoundationExtensions)
[![GitHub build results](https://github.com/wadetregaskis/FoundationExtensions/actions/workflows/swift.yml/badge.svg)](https://github.com/wadetregaskis/FoundationExtensions/actions/workflows/swift.yml)

A miscellaneous collection of extensions to Apple's Foundation framework.

### BidirectionalCollection

* `longestPrefix(where:)` determines the longest prefix that matches a given condition (optionally performing a transformation on that prefix, as well), using a binary search.

### BinaryInteger

* `bits` returns the individual bits of an integer, in an array.  e.g. `19.bits` -> `[1, 2, 16]`.
* `bitIndices` is like `bits` but returns the indices (as an `IndexSet`) instead of the values themselves, e.g. `19.bitIndices` -> `IndexSet([0...1], 4)`.

### Collections of UInt8s (e.g. `Array[UInt8]`, `Data`, etc)

* `asHexString(uppercase:delimiterEvery:delimiter:)` formats a `Data` into hex (as a `String`), e.g. `Data(bytes: "woot", count: 4).asHexString(delimiterEvery: 1)` -> `"77 6F 6F 74"`.
  * It also has a shorthand version `asHexString` for convenience (omitting the parentheses), if you don't need to customise its defaults.

### Comparable (e.g. numbers, strings, anything you can put into a range, etc).

* `clamp` and `clamped` to conform a value into a given range (supporting all finite range types), e.g. `5.clamped(..<0)` -> `-1`.
  * Note: up-to-but-not-including ranges (`..<`) are only supported on types that are _also_ `Strideable`.
  
### Data

* `asString(encoding:)` is a more ergonomic version of `String(data:encoding:)`.
  * It has a shorthand version `asString` which assumes UTF-8.
 
### Date

* `timeAgo` returns a human-readable, localised description of how long ago a given `Date` was, e.g. "2 hours ago".

### Float & Double

* `intMax` is the upper bound of the range of integer values that can be accurately represented in the respective floating-point type.

### IteratorProtocol

* `async` to return an async version of a sync iterator.
* `typeErased` property to convert the iterator to `AnyIterator`, as a convenience for cases such as optional chaining.

### Locale

* `POSIX` is a simple constant for the POSIX locale, as a convenience so you can write `Locale.POSIX` instead of `Locale(identifier: "en_US_POSIX")`.

### Optional

* `orNilString` returns a `String` describing the contents or the string literal "nil" if the `Optional` is empty.  For `Optional<String>` it returns the contained `String` directly (when present), for all other types it uses `String(describing:)`.

### StringProtocol

* `quoted` returns a quoted version of the string, with backslash-escaping for existing quotes and backslashes in the string.  e.g. `#"Hello, "Alex" \ "Alexis"."#.quoted` -> `#""Hello, \"Alex\" \\ \"Alexis\".""#`
