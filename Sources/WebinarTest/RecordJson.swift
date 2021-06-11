//
//  File.swift
//  
//
//  Created by Александр Пахомов on 11.06.2021.
//

import Foundation

public struct RecordJson: Equatable, Hashable, Codable {
    public var id: Int
    public var time: Int
    public var name: String
}
