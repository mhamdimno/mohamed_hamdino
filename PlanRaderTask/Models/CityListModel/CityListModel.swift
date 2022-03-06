//
//  CityListModel.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//
import Foundation

struct CityListModel: Codable {
    let id: Int?
    let name: String?
    let coord: Coord?
    let country: String?
}

extension CityListModel {
    static var empty: CityListModel {
        return CityListModel(id: nil, name: nil, coord: nil, country: nil)
    }
}
