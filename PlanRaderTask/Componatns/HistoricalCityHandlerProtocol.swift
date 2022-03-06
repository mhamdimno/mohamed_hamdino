//
//  HistoricalCityHandlerProtocol.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 06/03/2022.
//

import Foundation

protocol HistoricalCityHandlerProtocol {

func fetchWeathersFromStorge(data: City,completion: @escaping ((Result<[WeatherInfo], ErrorResult>) -> Void))
}
