//  Created by Wade Tregaskis on 2023-04-09.

import Foundation


public extension Locale {
    /// The POSIX locale (en\_US\_POSIX).
    @inlinable
    @inline(__always)
    static var POSIX: Locale {
        Locale(identifier: "en_US_POSIX")
    }
}
