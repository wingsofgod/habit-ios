//
//  ApiClient.swift
//  habit
//
//  Created by Canberk Bibican on 16.04.2022.
//

import Foundation
import Alamofire

class ApiClient {
    
    static let util = Util()

    static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion: @escaping (Result<T, Error>) -> Void) {
        util.activityIndicatorBegin()
        if Connectivity.isConnectedToInternet {
            AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
                switch response.result {
                case .success(let responseData):
                    completion(.success(responseData))
                case .failure(let error):
                    completion(.failure(error))
                }
                util.activityIndicatorEnd()
            }
        } else {
            util.activityIndicatorEnd()
            completion(.failure(CustomError.internetConnection))
        }
    }

    struct Connectivity {
        static let sharedInstance = NetworkReachabilityManager()!
        static var isConnectedToInternet: Bool {
            return self.sharedInstance.isReachable
        }
    }

}
