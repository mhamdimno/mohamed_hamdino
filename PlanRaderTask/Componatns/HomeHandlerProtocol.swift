//
//  WeatherListHandlerProtocol.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import Foundation

protocol HomeHandlerProtocol {
    func fetchCitiesFromStorge(completion: @escaping ((Result<[City], ErrorResult>) -> Void))
    func addCitytoStorge(weatherInformation: WeatherInformation, data: CityListModel, completion: @escaping ((Result<Bool, ErrorResult>) -> Void))
    func removeCityfromStorge(data: City, completion: @escaping ((Result<Bool, ErrorResult>) -> Void))
    func fetchCityWeatherInfoToSaveInRelation(withCity city: CityListModel, completion: @escaping ((Result<WeatherInformation, ErrorResult>) -> Void))
}
