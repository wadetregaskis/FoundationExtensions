//  Created by Wade Tregaskis on 2018-02-24.

import Foundation


public extension Optional {
    /// Returns the description (from ``String(describing:)``) of the value if it is non-nil, else the string "nil".
    var orNilString: String {
        if let value = self {
            return String(describing: value)
        } else {
            return "nil"
        }
    }
}

public extension Optional where Wrapped == String {
    /// Returns the string if it is non-nil, else the string "nil".
    var orNilString: String {
        if let self {
            return self
        } else {
            return "nil"
        }
    }
}
