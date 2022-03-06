//
//  WeatherListViewModelProtocol.swift
//  Weather
//
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import Foundation

protocol HomeViewModelProtocol {
    var weatherList: Dynamic<[City]> { get }
    func addCityToLocal(data:CityListModel)
    func removeCityFromLocal(data:City)
    var onErrorHandling: ((ErrorResult?) -> Void)? { get set }
    var isFinished: Dynamic<Bool> { get }
    func goToDetails(model:City?)
    func goToHistorical(model:City?)
    func goToAddCity()



}
