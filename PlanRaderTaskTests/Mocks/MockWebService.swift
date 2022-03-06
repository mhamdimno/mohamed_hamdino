//
//  MockWebService.swift
//  PlanRaderTaskTests
//
//  Created by A One Way To Allah on 05/03/2022.
//

import Foundation
@testable import PlanRaderTask

class MockWebService: WebServiceProtocol {
    var weatherData: Data?
    func fetchData(urlPath: URL?, completion: @escaping ((Result<Data, ErrorResult>) -> Void)) {
        if let data = weatherData {
            // completion(resource.parse(data))
        } else {
            //completion(nil)
        }
    }
   
}
