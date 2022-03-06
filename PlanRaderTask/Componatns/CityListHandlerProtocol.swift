//
//  CityListHandlerProtocol.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import Foundation

protocol CityListHandlerProtocol {
    func fetchCityInfo(withfileName fileName: String, completion: @escaping ((Result<[CityListModel], ErrorResult>) -> Void))
}
