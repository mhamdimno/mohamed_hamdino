//
//  WeatherListHandlerProtocol.swift
//  Weather
//
//  Created by Nischal Hada on 6/24/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

protocol WeatherListHandlerProtocol {
    func fetchCitiesFromStorge(completion: @escaping ((Result<[City], ErrorResult>) -> Void))
}
