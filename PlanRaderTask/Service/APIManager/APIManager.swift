//
//  APIManager.swift
//  Weather
//
//  Created by Nischal Hada on 6/18/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation



struct APIManager {
    private static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    private static let apiKey = "f5cb0b965ea1564c50c6f1b74534d823"
    private static let weatherUnit = "weather?"
    private static let groupUnit = "group?"

    private static let Metric = "metric"


    public static func weatherAPIURL(_ cityName: String) -> URL? {
        let weatherInfoUrl =  baseURLString + weatherUnit + "q=\(cityName)&units=\(Metric)&APPID=\(apiKey)"
        let finalURL = URL(string: weatherInfoUrl)
        return finalURL
    }
   
}
