//
//  APIManager.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
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
