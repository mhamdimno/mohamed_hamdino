//
//  FileManagerHandlerProtocol.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//
import Foundation

protocol FileManagerHandlerProtocol {
    func load<T>(resource: FileManagerResource<T>, completion: @escaping (T?) -> Void)
}
