//
//  WebService.swift
//  Weather
//
//  Created by Nischal Hada on 6/23/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
import AFNetworking
struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

class WebService: WebServiceProtocol {
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> Void) {
        print("url :", resource.url)
        let manager = AFHTTPSessionManager()
        manager.responseSerializer = AFHTTPResponseSerializer()
        manager.get(resource.url.description, parameters: nil, headers: nil, progress: nil, success: { task, object in
            guard let data = object as? Data else {
                //fail cast
                completion(nil)
                return }
            //success resonse
            DispatchQueue.main.async {
                completion(resource.parse(data))
            }
        }, failure: { task, error in
            //fail resonse
                completion(nil)
        })
        
    }
    
}

