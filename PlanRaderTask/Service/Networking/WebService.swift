//
//  WebService.swift
//  Weather
//
//  Created by Nischal Hada on 6/23/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import AFNetworking


class WebService: WebServiceProtocol {
    
//    func fetchCityWeatherInfo(city: City, completion: @escaping ((Result<WeatherInformation, ErrorResult>) -> Void)) {
//        let manager = AFHTTPSessionManager()
//        manager.responseSerializer = AFHTTPResponseSerializer()
//        manager.get(APIManager.brisbaneURL.description, parameters: nil, headers: nil, progress: nil, success: { task, object in
//            guard let data = object as? Data else {
//                completion(.failure(.parser(string: "Error while parsing APIs")))
//                return }
//            do {
//                let model = try JSONDecoder().decode(WeatherInformation.self, from: data)
//                completion(.success(model))
//            } catch {
//                completion(.failure(.parser(string: "Error while parsing json data")))
//            }
//        }, failure: { task, error in
//            completion(.failure(.parser(string: "InValid ApiKey")))
//        })
//    }
   
    
}

