//  Created by Wade Tregaskis on 2018-02-24.

import Foundation


extension Optional {
    var orNilString: String {
        if let value = self {
            return String(describing: value)
        } else {
            return "nil"
        }
    }
}

extension Optional where Wrapped == String {
    var orNilString: String {
        if let self {
            return self
        } else {
            return "nil"
        }
    }
}
