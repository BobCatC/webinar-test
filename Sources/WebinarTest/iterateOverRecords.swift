//
//  iterateOverRecords.swift
//  
//
//  Created by Александр Пахомов on 11.06.2021.
//

import Foundation

/// Creates an iterator over `time` sorted records to access `name` field from encoded `JSON` data
public func iterateOverRecords(inputData data: Data, timeAsc: Bool = true) throws -> NameIterator {
    let records = try JSONDecoder().decode([RecordJson].self, from: data)
    return records.nameIterator(timeAsc: timeAsc)
}

/// Returns array of names sorted by time
public func iterateOverRecordsSimple(inputData data: Data) throws -> [String] {
    let records = try JSONDecoder().decode([RecordJson].self, from: data)
    return records.sorted(by: { $0.time < $1.time }).map(\.name)
}

public extension Array where Element == RecordJson {
    /// Creates an iterator over `time` sorted records to access `name` field
    func nameIterator(timeAsc: Bool = true) -> NameIterator {
        NameIterator(unsortedRecords: self, timeAsc: timeAsc)
    }
}
