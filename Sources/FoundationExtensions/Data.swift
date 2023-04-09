//  Created by Wade Tregaskis on 2022-08-06.

import Foundation


public extension Data {
    func asString(encoding: String.Encoding) -> String? {
        String(data: self, encoding: encoding)
    }

    var asString: String? {
        asString(encoding: .utf8)
    }

    //                                            0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
    private static let hexCharacters: [UInt8] = [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70]

    func asHexString(spaceEvery: Int) -> String {
        //spaceEvery = abs(spaceEvery)

        let capacity = ((self.count * 2)
                        + Swift.max(0,
                                    ((0 != spaceEvery)
                                     ? (abs(self.count / spaceEvery)
                                        - ((0 == self.count % spaceEvery)
                                           ? 1
                                           : 0))
                                     : 0)))

        return String(unsafeUninitializedCapacity: capacity) {
            var i = 0
            var nextSpaceIn = abs(spaceEvery)

            for (offset, byte) in self.enumerated() {
                $0[i] = Data.hexCharacters[Int(byte / 16)]
                i += 1
                $0[i] = Data.hexCharacters[Int(byte % 16)]
                i += 1

                if 0 != spaceEvery && (offset + 1) < self.count {
                    nextSpaceIn -= 1

                    if 0 == nextSpaceIn {
                        $0[i] = 32
                        i += 1

                        nextSpaceIn = abs(spaceEvery)
                    }
                }
            }

            assert(i == capacity)
            return i
        }
    }

    var asHexString: String {
        asHexString(spaceEvery: 0)
    }
}
