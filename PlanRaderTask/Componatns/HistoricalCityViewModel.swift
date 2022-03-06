//
//  HistoricalCityViewModel.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import Foundation
protocol HistoricalCityProtocol {
    var weatherList: Dynamic<[WeatherInfo]> { get }
    var onErrorHandling: ((ErrorResult?) -> Void)? { get set }
    func goToDetails(model:City)
}
class HistoricalCityViewModel: HistoricalCityProtocol {

    
var onErrorHandling: ((ErrorResult?) -> Void)?
    let weatherList: Dynamic<[WeatherInfo]>
    private let city:City?
    let vc:HistoricalCityViewController

private let historicalListHandler: HistoricalCityHandlerProtocol!

    init(historicalListHandler: HistoricalCityHandlerProtocol = HistoricalCityHandler(), withWeatherInformation city: City?,vc:HistoricalCityViewController) {
    self.historicalListHandler = historicalListHandler
    self.city=city
    self.vc=vc
    self.weatherList = Dynamic([WeatherInfo()])
    self.fetchCityInfo()
}
    private func fetchCityInfo() {
        if let city = self.city {
        DispatchQueue.global(qos: .userInteractive).async {
            self.historicalListHandler.fetchWeathersFromStorge(data: city) { [weak self] result in
                switch result {
                case .success(let list) :
                    self?.weatherList.value = list
                    break
                case .failure(let error) :
                    print("Parser error \(error)")
                    self?.onErrorHandling?(error)
                    break
                }
            }
        }
    }
    }
    
    func goToDetails(model:City) {
        let dest=WeatherDetailViewController.instantiate()
        dest.weatherData=model
        vc.show(dest)
    }

}
