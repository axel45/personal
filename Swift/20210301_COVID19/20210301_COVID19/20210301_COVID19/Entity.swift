//
//  Entity.swift
//  20210301_COVID19
//
//  Created by 佐藤省吾 on 2021/03/07.
//

import Foundation

struct CovidInfo: Codable {
    
    struct Total: Codable {
        var pcr: Int
        var positive: Int
        var hospitalize: Int
        var severe: Int
        var death: Int
        var discharge: Int
    }
}