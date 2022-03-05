//
//  WeatherDetailHandler.swift
//  Weather
//
//  Created by Nischal Hada on 6/24/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import AFNetworking

class WeatherDetailHandler: WeatherDetailHandlerProtocol {
    
    

    private let webServiceHandler: WebServiceProtocol!

    init(withWebServiceHandler webServiceHandler: WebServiceProtocol = WebService()) {
        self.webServiceHandler = webServiceHandler
    }
    func fetchCityWeatherInfo(withCity city: City, completion: @escaping ((Result<WeatherInformation, ErrorResult>) -> Void)) {
        let manager = AFHTTPSessionManager()
        manager.responseSerializer = AFHTTPResponseSerializer()
        guard let fullUrl=APIManager.weatherAPIURL("\(city.name ?? "")") else{
            completion(.failure(.parser(string: "valid url")))
            return }

        manager.get(fullUrl.description.decodeUrl, parameters: nil, headers: nil, progress: nil, success: { task, object in
            guard let data = object as? Data else {
                completion(.failure(.parser(string: "Error while parsing APIs")))
                return }
            do {
                let model = try JSONDecoder().decode(WeatherInformation.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(.parser(string: "Error while parsing json data")))
            }
        }, failure: { task, error in
            completion(.failure(.parser(string: "InValid ApiKey")))
        })
    }
    
}


