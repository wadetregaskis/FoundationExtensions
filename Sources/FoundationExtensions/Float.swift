//  Created by Wade Tregaskis on 2024-02-03.

public extension Float {
    /// The upper bound on integers a Double can represent accurately (meaning conversion from integer to Double and back again will result in the original integer value).
    ///
    /// This is not necessarily the largest _individual_ integer value that can survive the roundtrip.  _Some_ values above this limit may also make the round trip successfully, but it is not guaranteed; some definitely will not.  This defines the upper limit of the _range_ of integers that can _all_ be round-tripped accurately.
    ///
    /// The limit extends identically in the negative direction as well, so the full range of accurately-represented integers is [-intMax, intMax].
    static let intMax = Float(UInt64(2) << Self.significandBitCount)
}
