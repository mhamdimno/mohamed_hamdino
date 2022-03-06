//
//  WeatherDetailViewModelProtocol.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//
import Foundation

protocol WeatherDetailViewModelProtocol {
    var onErrorHandling: ((ErrorResult?) -> Void)? { get set }
    var isFinished: Dynamic<Bool> { get }
    var cityWeather: Dynamic<WeatherInformation> { get }
    
}
