//  Created by Wade Tregaskis on 2022-08-06.

import Foundation


public extension Data {
    func asString(encoding: String.Encoding) -> String? {
        String(data: self, encoding: encoding)
    }

    var asString: String? {
        asString(encoding: .utf8)
    }
}
