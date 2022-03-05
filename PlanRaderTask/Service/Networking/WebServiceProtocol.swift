//
//  WebServiceProtocol.swift
//  Weather
//
//  Created by Nischal Hada on 6/23/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

protocol WebServiceProtocol {
    func fetchData(urlPath: URL?, completion: @escaping ((Result<Data, ErrorResult>) -> Void))
}
