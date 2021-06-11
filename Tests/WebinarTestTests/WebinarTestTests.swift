import XCTest
@testable import WebinarTest

final class WebinarTestTests: XCTestCase {
    func testIterateOverRecords() throws {
        let input = try generateTestData(count: 10_000, timeRange: -10_000..<10_000)

        // Testable function
        var iterator = try iterateOverRecords(inputData: input)

        while let name = iterator.next() {
            print(name)
        }
    }

    /// Generates array of `RecordJson` with serial `id` and random `time`
    private func generateRecords(count: Int, timeRange: Range<Int> = -1_000..<1_000) -> [RecordJson] {
        (0..<count).map { index -> RecordJson in
            let time = Int.random(in: timeRange)
            return RecordJson(id: index, time: time, name: "name-\(index), time: \(time)")
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
