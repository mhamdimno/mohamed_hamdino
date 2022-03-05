//
//  WeatherListHandler.swift
//  Weather
//
//  Created by Nischal Hada on 6/24/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit

class WeatherListHandler: WeatherListHandlerProtocol {
    
    func fetchCitiesFromStorge(completion: @escaping ((Result<[City], ErrorResult>) -> Void)) {
        let weatherList = PersistanceManager.shared.fetchCitys()
        completion(.success(weatherList))
    }
    func addCitytoStorge(data:CityListModel,completion: @escaping ((Result<Bool, ErrorResult>) -> Void)) {
        PersistanceManager.shared.setCity(data: data)
        completion(.success(true))
    }
    init() {

    }

    
}
