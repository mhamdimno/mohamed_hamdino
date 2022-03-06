//
//  AddCityViewModelProtocol.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import Foundation

protocol AddCityViewModelProtocol {
    var cityListModel: Dynamic<[CityListModel]> { get }
    var onErrorHandling: ((ErrorResult?) -> Void)? { get set }
    var isFinished: Dynamic<Bool> { get }
    func addCityAndDismiss()
}
