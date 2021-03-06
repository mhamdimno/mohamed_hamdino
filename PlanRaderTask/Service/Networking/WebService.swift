//
//  WebService.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//
import Foundation
import AFNetworking


class WebService: WebServiceProtocol {
    
     func fetchData(urlPath : URL? ,completion: @escaping ((Result<Data, ErrorResult>) -> Void)) {
         guard let urlPath=urlPath else{
             completion(.failure(.parser(string: "invalid url")))

             return }
        let manager = AFHTTPSessionManager()
        
        manager.responseSerializer = AFHTTPResponseSerializer()
         manager.get(urlPath.description.decodeUrl, parameters: nil, headers: nil, progress: nil, success: { _, object in
            guard let data = object as? Data else {
                completion(.failure(.parser(string: "Error while parsing APIs")))
                return }
                completion(.success(data))
        
        }, failure: { task, error in
            completion(.failure(.parser(string: "InValid ApiKey")))
        })
    }
    
}



        
        
