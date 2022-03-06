//
//  WeatherInformation.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//
import Foundation

struct WeatherInformation: Codable {
    var main: Main?
    var name: String?
    var id: Int?
    var coord: Coord?
    var weather: [Weather]?
    var clouds: Clouds?
    var dt: Int?
    var base: String?
    var sys: Sys?
    var cod: Int?
    var visibility: Int?
    var wind: Wind?
}

extension WeatherInformation {
    static var empty: WeatherInformation {
        return WeatherInformation(main: nil, name: nil, id: nil, coord: nil, weather: nil, clouds: nil, dt: nil, base: nil, sys: nil, cod: nil, visibility: nil, wind: nil)
    }
}
