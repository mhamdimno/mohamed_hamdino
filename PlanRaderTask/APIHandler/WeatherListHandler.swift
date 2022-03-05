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

    init() {

    }

    
}
