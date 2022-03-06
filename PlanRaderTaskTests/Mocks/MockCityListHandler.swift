//
//  MockCityListHandler.swift
//  PlanRaderTaskTests
//
//  Created by A One Way To Allah on 05/03/2022.
//

import Foundation
@testable import PlanRaderTask

class MockCityListHandler: CityListHandlerProtocol {
    var cityListData: [CityListModel]? = [CityListModel]()

    func fetchCityInfo(withfileName fileName: String, completion: @escaping ((Result<[CityListModel], ErrorResult>) -> Void)) {
        if let result = cityListData {
            completion(.success(result))
        } else {
            completion(.failure(.parser(string: "Error while parsing json data")))
        }
    }
}
