//  Created by Wade Tregaskis on 2024-03-02.

import Foundation


public extension ContiguousBytes {
    var count: Int {
        self.withUnsafeBytes {
            $0.count
        }
    }

    var isEmpty: Bool {
        0 == self.count
    }
}
