//
//  NameIterator.swift
//  
//
//  Created by Александр Пахомов on 11.06.2021.
//

import Foundation

/// Iterator over sorted by `time` `[RecordJson]` with `name` as element
public struct NameIterator: IteratorProtocol {

    /// `name` field of `RecordJson`
    public typealias Element = String

    /// Sorted array of `RecordJson`
    let records: [RecordJson]
    private var index = 0

    init(unsortedRecords records: [RecordJson], timeAsc: Bool = true) {
        var records = records
        if timeAsc {
            records = records.sorted(by: { $0.time < $1.time })
        } else {
            records = records.sorted(by: { $0.time > $1.time })
        }

        self.records = records
    }

    init(sortedRecords records: [RecordJson]) {
        // Should be here a check that array is sorted?
        self.records = records
    }

    public mutating func next() -> String? {
        let element = records.at(index)
        index += 1
        return element?.name
    }
}
