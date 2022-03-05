//
//  WeatherDetailHandlerProtocol.swift
//  Weather
//
//  Created by Nischal Hada on 6/24/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

protocol WeatherDetailHandlerProtocol {
    func fetchCityWeatherInfo(withCity city: City, completion: @escaping ((Result<WeatherInformation, ErrorResult>) -> Void))
}
