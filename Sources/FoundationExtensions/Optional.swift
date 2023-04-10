//  Created by Wade Tregaskis on 10/4/2023-04-10.

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
