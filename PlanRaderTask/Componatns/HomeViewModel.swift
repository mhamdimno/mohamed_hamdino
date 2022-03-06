//
//  WeatherListViewModel.swift
//  Weather
//
//  Created by Nischal Hada on 6/23/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol {
   
    
  
    

    let weatherList: Dynamic<[City]>
    let isFinished: Dynamic<Bool>
    var onErrorHandling: ((ErrorResult?) -> Void)?
    let vc:HomeTableViewController

    private let weatherListHandler: HomeHandlerProtocol!


    init(withWeatherListHandler weatherListHandler: HomeHandlerProtocol = HomeHandler(),vc:HomeTableViewController) {
        self.weatherListHandler = weatherListHandler
        self.weatherList = Dynamic([])
        self.vc=vc
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
    func removeDuplicateElements(cities: [City]) -> [City] {
        var uniqueCities = [City]()
        for city in cities {
            if !uniqueCities.contains(where: {$0.id == city.id }) {
                uniqueCities.append(city)
            }
        }
        return uniqueCities
    }
    
   
    func addCityToLocal(data: CityListModel){
        DispatchQueue.global(qos: .userInteractive).async {
            self.weatherListHandler.fetchCityWeatherInfoToSaveInRelation(withCity: data) { [weak self] result in

                switch result {
                case .success(let model) :
                    self?.weatherListHandler.addCitytoStorge(weatherInformation: model, data: data){ [weak self] result in

                        self?.isFinished.value = true
                        switch result {
                        case .success(_) :
                            self?.isFinished.value = true
                            self?.fetchCityInfo()
                            break
                        case .failure(let error) :
                            print("Parser error \(error)")
                            self?.isFinished.value = true
                            self?.onErrorHandling?(error)
                            break
                        }
                    }
                  
                case .failure(let error) :
                    print("Parser error \(error)")
                    self?.isFinished.value = true
                    self?.onErrorHandling?(error)
                    break
                }
            }
        }
    }
    func removeCityFromLocal(data: City) {
        self.weatherListHandler.removeCityfromStorge(data: data){ [weak self] result in
            self?.isFinished.value = true
            switch result {
            case .success(_) :
                break
            case .failure(let error) :
                print("Parser error \(error)")
                break
            }
        }
    }
    func goToDetails(model:City?) {
        let dest=WeatherDetailViewController.instantiate()
        dest.weatherData=model
        vc.move(dest)
    }
    func goToHistorical(model: City?) {
        let dest=HistoricalCityViewController.instantiate()
        dest.city=model
        vc.to(dest)
    }
    func goToAddCity() {
        let dest=AddCitiesViewController.instantiate()
        dest.delegate=vc
        vc.move(dest)
    }
  
}
