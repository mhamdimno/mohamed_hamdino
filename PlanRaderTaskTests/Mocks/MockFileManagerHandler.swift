//
//  MockFileManagerHandler.swift
//  PlanRaderTaskTests
//
//  Created by A One Way To Allah on 05/03/2022.
//

import Foundation
@testable import PlanRaderTask

class MockFileManagerHandler: FileManagerHandlerProtocol {
    var cityData: Data?

    func load<T>(resource: FileManagerResource<T>, completion: @escaping (T?) -> Void) {
        if let data = cityData {
            completion(resource.parse(data))
        } else {
            completion(nil)
        }
    }
}
