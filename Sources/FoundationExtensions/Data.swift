//  Created by Wade Tregaskis on 2022-08-06.

public import Foundation


public extension Data {
    /// A convenience wrapper over ``String(data:encoding:)``, to make it usable with optional chaining.
    /// - Parameter encoding: The encoding method that the data should be compliant with.
    /// - Returns: The decoded string, or nil if the data is not compliant with the given string encoding.
    @inlinable
    @inline(__always)
    func asString(encoding: String.Encoding) -> String? {
        String(data: self, encoding: encoding)
    }

    // The data as a valid UTF-8 string, or nil if the data is not a valid UTF-8 string.
    @inlinable
    @inline(__always)
    var asString: String? {
        asString(encoding: .utf8)
    }
}
