//
//  WeatherListHandler.swift
//  Weather
//
//  Created by Nischal Hada on 6/24/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit

class HomeHandler: HomeHandlerProtocol {
 
    
    private let webServiceHandler: WebServiceProtocol!

    init(withWebServiceHandler webServiceHandler: WebServiceProtocol = WebService()) {
        self.webServiceHandler = webServiceHandler
    }
    func fetchCitiesFromStorge(completion: @escaping ((Result<[City], ErrorResult>) -> Void)) {
        let weatherList = PersistanceManager.shared.fetchCitys()
        completion(.success(weatherList))
    }
    func addCitytoStorge(weatherInformation:WeatherInformation,data:CityListModel,completion: @escaping ((Result<Bool, ErrorResult>) -> Void)) {
        PersistanceManager.shared.setCity(data: data, weatherInformation: weatherInformation)
        completion(.success(true))
    }
    func removeCityfromStorge(data: City, completion: @escaping ((Result<Bool, ErrorResult>) -> Void)) {
        PersistanceManager.shared.deleteCity(city: data)
        completion(.success(true))
    }
    func fetchCityWeatherInfoToSaveInRelation(withCity city: CityListModel, completion: @escaping ((Result< WeatherInformation , ErrorResult>) -> Void)) {
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
