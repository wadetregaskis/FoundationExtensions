//  Created by Wade Tregaskis on 2024-03-02.

public extension Collection where Element == UInt8 {
    /// - Parameters:
    ///   - uppercase: Whether to use "A" through "F", or "a" through "f".
    ///   - delimiterEvery: Insert `delimiter` every this number of elements (``UInt8``s).  If zero, no delimiters are inserted.
    ///
    ///       The sign is ignored, so e.g. -2 means 2.
    ///   - delimiter: The delimiter to use.  Has no effect if `delimiterEvery` is zero.
    /// - Returns: A string presenting the contents of the collection in human-readable hexadecimal.
    func asHexString(uppercase: Bool = true,
                     delimiterEvery: Int = 0,
                     delimiter: String = " ") -> String {
        let capacity = ((self.count * 2)
                        + Swift.max(0,
                                    ((0 != delimiterEvery)
                                     ? (abs(self.count / delimiterEvery)
                                        - ((0 == self.count % delimiterEvery)
                                           ? 1
                                           : 0)) * delimiter.utf8.count
                                     : 0)))
        let letterOffset = (uppercase ? UInt8(ascii: "A") : UInt8(ascii: "a")) - 10

        return String(unsafeUninitializedCapacity: capacity) {
            var i = 0
            var nextSpaceIn = abs(delimiterEvery)

            @inline(__always) func toHex(_ value: UInt8) -> UInt8 {
                if value > 9 {
                    return value + letterOffset
                } else {
                    return value + UInt8(ascii: "0")
                }
            }

            for (offset, byte) in self.enumerated() {
                $0[i] = toHex(byte / 16)
                i += 1
                $0[i] = toHex(byte % 16)
                i += 1

                if 0 != delimiterEvery && (offset + 1) < self.count {
                    nextSpaceIn -= 1

                    if 0 == nextSpaceIn {
                        i = $0[i..<(i + delimiter.utf8.count)].initialize(fromContentsOf: delimiter.utf8)

                        nextSpaceIn = abs(delimiterEvery)
                    }
                }
            }

            assert(i == capacity)
            return i
        }
    }

    /// An ASCII representation of the given collection's ``UInt8`` contents, in uppercase and without any spaces.
    ///
    /// This is equivalent to calling ``asHexString(uppercase:delimiterEvery:delimiter:)`` with default arguments.  It is provided as a convenience so that the parentheses may be omitted.
    @inlinable
    @inline(__always)
    var asHexString: String {
        asHexString()
    }
}
