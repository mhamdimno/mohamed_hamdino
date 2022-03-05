//
//  WeatherListHandlerProtocol.swift
//  Weather
//
//  Created by Nischal Hada on 6/24/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

protocol HomeHandlerProtocol {
    func fetchCitiesFromStorge(completion: @escaping ((Result<[City], ErrorResult>) -> Void))
    func addCitytoStorge(weatherInformation: WeatherInformation, data: CityListModel, completion: @escaping ((Result<Bool, ErrorResult>) -> Void))
    func removeCityfromStorge(data: City, completion: @escaping ((Result<Bool, ErrorResult>) -> Void))
    func fetchCityWeatherInfoToSaveInRelation(withCity city: CityListModel, completion: @escaping ((Result<WeatherInformation, ErrorResult>) -> Void))

}
