//
//  WeatherListViewModelProtocol.swift
//  Weather
//
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import Foundation

protocol WeatherListViewModelProtocol {
    var weatherList: Dynamic<[City]> { get }
    func addCityToLocal(data:CityListModel)
    var onErrorHandling: ((ErrorResult?) -> Void)? { get set }
    var isFinished: Dynamic<Bool> { get }

}
