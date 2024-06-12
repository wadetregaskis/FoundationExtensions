//  Created by Wade Tregaskis on 2024-03-11.

import XCTest
@testable import FoundationExtensions


final class AsyncSequenceTests: XCTestCase {
    let input = "Coming back to where you started is not the same as never leaving." // Terry Pratchett (via Tiffany Aching), A Hat Full of Sky.

    var testStream: AsyncStream<Character> {
        return AsyncStream { continuation in
            Task { [input] in
                for character in input {
                    continuation.yield(character)
                }

                continuation.finish()
            }
        }
    }

    enum Errors: Error {
        case 💣
    }

    var testStreamThrowing: AsyncThrowingStream<Character, any Error> {
        return AsyncThrowingStream { continuation in
            Task { [input] in
                for character in input.prefix(25) {
                    continuation.yield(character)
                }

                continuation.finish(throwing: Errors.💣)
            }
        }
    }

    func testCollect() async throws {
        do {
            let result: String = await testStream.collect(upTo: "C")
            XCTAssertEqual(result, "")
        }

        do {
            let result: String = await testStream.collect(upTo: "started")
            XCTAssertEqual(result, "Coming back to where you ")
        }

        do {
            let result: String = await testStream.collect(upTo: "where", stripTerminator: false)
            XCTAssertEqual(result, "Coming back to where")
        }

        do {
            let result: String = await testStream.collect(upTo: "Tiffany")
            XCTAssertEqual(result, input)
        }

        do {
            let result: String = try await testStreamThrowing.collect(upTo: " you")
            XCTAssertEqual(result, "Coming back to where")
        }

        do {
            let result: String? = try? await testStreamThrowing.collect(upTo: "same ")
            XCTAssertNil(result)
        }
    }
}
