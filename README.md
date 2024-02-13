#  FoundationExtensions

[![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/wadetregaskis/FoundationExtensions.svg)]()
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fwadetregaskis%2FFoundationExtensions%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/wadetregaskis/FoundationExtensions)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fwadetregaskis%2FFoundationExtensions%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/wadetregaskis/FoundationExtensions)
[![GitHub build results](https://github.com/wadetregaskis/FoundationExtensions/actions/workflows/swift.yml/badge.svg)](https://github.com/wadetregaskis/FoundationExtensions/actions/workflows/swift.yml)

A miscellaneous collection of extensions to Apple's Foundation framework.

### BinaryInteger

* `bits` returns the individual bits of an integer, in an array.  e.g. `19.bits` -> `[1, 2, 16]`.
* `bitIndices` is like `bits` but returns the indices (as an `IndexSet`) instead of the values themselves, e.g. `19.bitIndices` -> `IndexSet([0...1], 4)`.

### Data

* `asString(encoding:)` is a more ergonomic version of `String(data:encoding:)`.
  * It has a shorthand version `asString` which assumes UTF-8.
* `asHexString(uppercase:delimiterEvery:delimiter:)` formats a `Data` into hex (as a `String`), e.g. `Data(bytes: "woot", count: 4).asHexString(delimiterEvery: 1)` -> `"77 6F 6F 74"`.
  * It also has a shorthand version `asHexString` for convenience (omitting the parentheses), if you don't need to customise its defaults.
 
### Date

* `timeAgo` returns a human-readable, localised description of how long ago a given `Date` was, e.g. "2 hours ago".

### Float & Double

* `intMax` is the upper bound of the range of integer values that can be accurately represented in the respective floating-point type.

### Locale

* `POSIX` is a simple constant for the POSIX locale, as a convenience so you can write `Locale.POSIX` instead of `Locale(identifier: "en_US_POSIX")`.

### Optional

* `orNilString` returns a `String` describing the contents or the string literal "nil" if the `Optional` is empty.  For `Optional<String>` it returns the contained `String` directly (when present), for all other types it uses `String(describing:)`.

### StringProtocol

* `quoted` returns a quoted version of the string, with backslash-escaping for existing quotes and backslashes in the string.  e.g. `#"Hello, "Alex" \ "Alexis"."#.quoted` -> `#""Hello, \"Alex\" \\ \"Alexis\".""#`
