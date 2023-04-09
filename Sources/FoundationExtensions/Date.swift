//  Created by Wade Tregaskis on 2022-08-07.

import Foundation


extension Date {
    static let relativeDateTimeFormatter = {
        var formatter = RelativeDateTimeFormatter()
        formatter.dateTimeStyle = .named
        formatter.unitsStyle = .full
        formatter.formattingContext = .standalone
        return formatter
    }()

    var timeAgo: String {
        Date.relativeDateTimeFormatter.localizedString(for: self, relativeTo: Date.now)
    }
}
