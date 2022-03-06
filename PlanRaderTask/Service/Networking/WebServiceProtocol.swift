//
//  WebServiceProtocol.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import Foundation

protocol WebServiceProtocol {
    func fetchData(urlPath: URL?, completion: @escaping ((Result<Data, ErrorResult>) -> Void))
}
