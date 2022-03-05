//
//  WeatherDetailViewModel.swift
//  Weather
//
//  Created by Nischal Hada on 6/24/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

class WeatherDetailViewModel: WeatherDetailViewModelProtocol {

    let cityWeather: Dynamic<WeatherInformation>
    var onErrorHandling: ((ErrorResult?) -> Void)?
    let isFinished: Dynamic<Bool>

    private let weatherDetailHandler: WeatherDetailHandlerProtocol!
    private let city:City?

    init(withCityListHandler weatherDetailHandler: WeatherDetailHandlerProtocol = WeatherDetailHandler(), withWeatherInformation city: City?) {
        self.weatherDetailHandler = weatherDetailHandler
        self.city = city
        self.isFinished = Dynamic(false)
        self.cityWeather = Dynamic(WeatherInformation())
        self.fetchCityWeatherInfo()
    }

    private func fetchCityWeatherInfo() {
        if let city = self.city {
            DispatchQueue.global(qos: .userInteractive).async {
//                self.weatherDetailHandler.load(withCity: city) {object in
//                    self?.isFinished.value = true
//
//                    guard let data = object as? Data else {
//                        completion(.failure(.parser(string: "Error while parsing APIs")))
//                        return }
//                    do {
//                        let model = try JSONDecoder().decode(WeatherInformation.self, from: data)
//                        completion(.success(model))
//                        self?.cityWeather.value = model
//                    } catch {
//                        completion(.failure(.parser(string: "Error while parsing json data")))
//                    }
//                    do {
//                        let model = try JSONDecoder().decode(WeatherInformation.self, from: data)
//                        completion(.success(model))
//                    } catch {
//                        completion(.failure(.parser(string: "Error while parsing json data")))
//                    }
//                }
                self.weatherDetailHandler.fetchCityWeatherInfo(withCity: city) { [weak self] result in
                    DispatchQueue.main.async {
                        self?.isFinished.value = true
                        switch result {
                        case .success(let model) :
                            self?.cityWeather.value = model
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
        } else {
            self.onErrorHandling?(ErrorResult.custom(string: "WeatherInformation is missing"))
        }
    }
}
