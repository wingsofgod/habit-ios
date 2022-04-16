//
//  ApiEndPoint.swift
//  habit
//
//  Created by Canberk Bibican on 16.04.2022.
//

import Foundation
import Alamofire

enum ApiEndPoint: APIConfiguration {

    case animalList
    case categoryList
    // query -> case animalList(id: String)
    // parameters -> case animalList(params: [String: Any])
    var method: HTTPMethod {
        switch self {
        case .animalList: return .get
        case .categoryList: return .get
        }
    }

    var path: String {
        switch self {
        case .animalList: return "animals.json"
        case .categoryList: return "category.json"
        //query -> case .animalList(let id): return "animals.json"+id
        }
    }

    var parameters: Parameters? {
        switch self {
        case .animalList: return nil
        case .categoryList: return nil
        // parameters -> case .animalList(let params): return params
        }

    }

    func asURLRequest() throws -> URLRequest {
        //https://raw.githubusercontent.com/wingsofgod/habit-mock-data/main/animals.json
        let baseUrl = try "https://raw.githubusercontent.com/wingsofgod/habit-mock-data/main/".asURL()
        var urlRequest = URLRequest(url: baseUrl.appendingPathComponent(path))
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        // HTTP Headers
        urlRequest.headers = headers
        // Parameters
        let encoding: ParameterEncoding = {
            switch method {
            case .post:
                return JSONEncoding.default
            default:
                return URLEncoding.default
            }
        }()

        return try encoding.encode(urlRequest, with: parameters)

    }

    var headers: HTTPHeaders {
        return ["Content-Type": "application/json",
            "Accept": "application/json"]
    }
}
