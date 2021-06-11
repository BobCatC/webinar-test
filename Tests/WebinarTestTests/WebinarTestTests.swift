import XCTest
@testable import WebinarTest

final class WebinarTestTests: XCTestCase {
    func testExample() {
        
    }

    static var allTests = [
        ("testExample", testExample),
    ]

    /// Generates array of `RecordJson` with serial `id` and random `time`
    private func generateRecords(count: Int, timeRange: Range<Int> = -1_000..<1_000) -> [RecordJson] {
        (0..<count).map { index -> RecordJson in
            RecordJson(id: index, time: Int.random(in: timeRange), name: "name-\(index)")
        }
    }

    /// Generates records and encodes it to `Data`
    private func generateTestData(count: Int, timeRange: Range<Int>) throws -> Data {
        var records = generateRecords(count: count, timeRange: timeRange)
        /// Needed to shuffle serial `id ` order of records
        records = records.shuffled()
        return try JSONEncoder().encode(records)
    }
}
