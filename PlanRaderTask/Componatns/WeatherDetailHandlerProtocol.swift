//
//  WeatherDetailHandlerProtocol.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import Foundation

protocol WeatherDetailHandlerProtocol {
    func fetchCityWeatherInfo(withCity city: City, completion: @escaping ((Result<WeatherInformation, ErrorResult>) -> Void))
}
