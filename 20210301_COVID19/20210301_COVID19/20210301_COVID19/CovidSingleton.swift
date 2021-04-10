//
//  CovidSingleton.swift
//  20210301_COVID19
//
//  Created by 佐藤省吾 on 2021/03/30.
//

import Foundation

class CovidSingleton {
    
    private init() {}
    static let shared = CovidSingleton()
    var prefecture:[CovidInfo.Prefecture] = []
}
