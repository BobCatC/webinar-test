import XCTest
@testable import WebinarTest

final class WebinarTestTests: XCTestCase {
    func testSimpleImplementation() throws {
        let input = try generateTestData(count: 100, timeRange: -100..<100)

        // Testable function
        let sortedNames = try iterateOverRecordsSimple(inputData: input)

        for name in sortedNames {
            print(name)
        }
    }

    func testIterateOverRecords() throws {
        let input = try generateTestData(count: 10_000, timeRange: -10_000..<10_000)

        // Testable function
        var iterator = try iterateOverRecords(inputData: input)

        XCTAssertNotNil(iterator.next())
        while let name = iterator.next() {
            print(name)
        }
    }

    func testIterateTimeAsc() throws {
        let records = [RecordJson(id: 1, time: 1, name: "1"), RecordJson(id: 2, time: 2, name: "2")]
        let input = try JSONEncoder().encode(records)

        // Testable function
        var iterator = try iterateOverRecords(inputData: input, timeAsc: true)

        let first = iterator.next()
        let second = iterator.next()

        XCTAssertNotNil(first)
        XCTAssertNotNil(second)

        XCTAssertEqual(first, "1")
        XCTAssertEqual(second, "2")
    }

    func testIterateTimeDesc() throws {
        let records = [RecordJson(id: 1, time: 1, name: "1"), RecordJson(id: 2, time: 2, name: "2")]
        let input = try JSONEncoder().encode(records)

        // Testable function
        var iterator = try iterateOverRecords(inputData: input, timeAsc: false)

        let first = iterator.next()
        let second = iterator.next()

        XCTAssertNotNil(first)
        XCTAssertNotNil(second)

        XCTAssertEqual(first, "2")
        XCTAssertEqual(second, "1")
    }

    func testZeroRecords() throws {
        let input = try generateTestData(count: 0, timeRange: 0..<1)

        var iterator = try iterateOverRecords(inputData: input)
        XCTAssertNil(iterator.next())
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
