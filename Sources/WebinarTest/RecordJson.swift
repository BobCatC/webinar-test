//
//  File.swift
//  
//
//  Created by Александр Пахомов on 11.06.2021.
//

import Foundation

struct RecordJson: Equatable, Hashable, Codable {
    var id: Int
    var time: Int
    var name: String
}
