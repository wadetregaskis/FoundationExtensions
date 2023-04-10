//  Created by Wade Tregaskis on 2023-04-10.

import XCTest
@testable import FoundationExtensions


final class StringProtocolTests: XCTestCase {
    func testQuoted() throws {
        for (input, output) in [("", #""""#),
                                (" ", #"" ""#),
                                ("Hello", #""Hello""#),
                                (#"""#, #""\"""#),
                                (#"\"#, #""\\""#),
                                (#"\""#, #""\\\"""#),
                                (#"Hello, "world"."#, #""Hello, \"world\".""#)] {
            XCTAssertEqual(input.quoted, output)
        }
    }
}
