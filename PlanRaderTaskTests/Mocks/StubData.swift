//
//  StubData.swift
//  PlanRaderTaskTests
//
//  Created by A One Way To Allah on 05/03/2022.
//

import XCTest
@testable import PlanRaderTask

class StubData {
    static let shared = StubData()

    init() {

    }
}

extension StubData {
    func readJson(forResource fileName: String ) -> Data? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTAssert(false, "Missing file: \(fileName).json")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch (_) {
            XCTAssert(false, "unable to read json")
            return nil
        }
    }
}
