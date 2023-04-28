//  Created by Wade Tregaskis on 2022-08-06.

import Foundation


public extension Data {
    func asString(encoding: String.Encoding) -> String? {
        String(data: self, encoding: encoding)
    }

    var asString: String? {
        asString(encoding: .utf8)
    }

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

    var asHexString: String {
        asHexString()
    }
}
