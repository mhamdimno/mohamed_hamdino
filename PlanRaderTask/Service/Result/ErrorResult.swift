//
//  ErrorResult.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
