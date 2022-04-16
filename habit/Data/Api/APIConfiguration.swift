//
//  APIConfiguration.swift
//  habit
//
//  Created by Canberk Bibican on 16.04.2022.
//


import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
