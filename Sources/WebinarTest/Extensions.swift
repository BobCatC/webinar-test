//
//  Extensions.swift
//  
//
//  Created by Александр Пахомов on 11.06.2021.
//

import Foundation

extension Collection where Index == Int {
    /// Safe index subscript
    func at(_ index: Int) -> Element? {
        guard 0..<count ~= index else { return nil }
        return self[index]
    }
}
