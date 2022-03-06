//
//  HistoricalCityHandler.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 06/03/2022.
//

import Foundation

class HistoricalCityHandler: HistoricalCityHandlerProtocol {
    func fetchWeathersFromStorge(data: City, completion: @escaping ((Result<[WeatherInfo], ErrorResult>) -> Void)) {
        let weatherList = PersistanceManager.shared.fetchWeatherInfo(city: data)
        completion(.success(weatherList))
    }
    
}
