//
//  Result.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import Foundation

enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}

public enum NetworkResult<T> {
    case success(T)
    case failure(Error)
}
