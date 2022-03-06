//
//  NetworkingError.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import Foundation

enum NetworkingError: LocalizedError {
    case badJSON
    public var errorDescription: String? {
        switch self {
        case .badJSON:
            return NSLocalizedString("The data from the server came back in a way we couldn't use", comment: "")
        }
    }
}
