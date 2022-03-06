//
//  WeatherMapResult.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import Foundation

struct WeatherMapResult: Codable {
    var cnt: Int?
    var list: [WeatherInformation]?
}
