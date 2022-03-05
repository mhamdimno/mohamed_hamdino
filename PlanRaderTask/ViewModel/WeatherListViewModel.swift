//
//  WeatherListViewModel.swift
//  Weather
//
//  Created by Nischal Hada on 6/23/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

class WeatherListViewModel: WeatherListViewModelProtocol {
  
    

    let weatherList: Dynamic<[City]>
    let isFinished: Dynamic<Bool>
    var onErrorHandling: ((ErrorResult?) -> Void)?

    private let weatherListHandler: WeatherListHandlerProtocol!


    init(withWeatherListHandler weatherListHandler: WeatherListHandlerProtocol = WeatherListHandler()) {
        self.weatherListHandler = weatherListHandler
        self.weatherList = Dynamic([])
        self.isFinished = Dynamic(false)
        self.fetchCityInfo()
    }
    
    private func fetchCityInfo() {
        DispatchQueue.global(qos: .userInteractive).async {
            self.weatherListHandler.fetchCitiesFromStorge() { [weak self] result in
                self?.isFinished.value = true
                switch result {
                case .success(let list) :
                    self?.weatherList.value = list

                    break
                case .failure(let error) :
                    print("Parser error \(error)")
                    self?.isFinished.value = true
                    self?.onErrorHandling?(error)
                    break
                }
            }
        }
    }

    func addCityToLocal(data: CityListModel){
        DispatchQueue.global(qos: .userInteractive).async {
            self.weatherListHandler.addCitytoStorge(data: data){ [weak self] result in
                self?.isFinished.value = true
                switch result {
                case .success(_) :
                    self?.fetchCityInfo()
                    break
                case .failure(let error) :
                    print("Parser error \(error)")
                    self?.isFinished.value = true
                    self?.onErrorHandling?(error)
                    break
                }
            }
        }
    }
}
