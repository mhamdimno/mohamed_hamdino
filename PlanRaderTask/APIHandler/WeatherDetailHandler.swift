//
//  WeatherDetailHandler.swift
//  Weather
//
//  Created by Nischal Hada on 6/24/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation


class WeatherDetailHandler: WeatherDetailHandlerProtocol {
   
    private let webServiceHandler: WebServiceProtocol!

    init(withWebServiceHandler webServiceHandler: WebServiceProtocol = WebService()) {
        self.webServiceHandler = webServiceHandler
    }
    func fetchCityWeatherInfo(withCity city: City, completion: @escaping ((Result< WeatherInformation , ErrorResult>) -> Void)) {
         let fullUrl=APIManager.weatherAPIURL("\(city.name ?? "")")
        webServiceHandler.fetchData(urlPath: fullUrl) { result in
            switch (result){
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode(WeatherInformation.self, from: data)
                    completion(.success(model))
                } catch {
                    completion(.failure(.parser(string: "Error while parsing json data")))
                }
            case .failure(let error):
                completion(.failure(error))

            }
        }
    }
}


