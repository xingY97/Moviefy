//
//  Request.swift
//  Moviefy
//
//  Created by X Y on 5/5/21.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public enum Route: String{
    case movies = "discover/movie"
}

struct Request {
    static let headers = [
        "Accept":"Application/json",
        "Content-Type":"Applicatoin/json",
        "Authorizatoin":"e876d92222f5e25dbca0fa994d4bafad"
    ]
    
    static func configureRequest(from route: Route, with parameters: [String: Any], and method: HTTPMethod, contains body: Data?) throws -> URLRequest {
        
        //safely unwrap URL or return error
        guard let url = URL(string: "https://api.themoviedb.org/3/\(route.rawValue)") else { fatalError("Error while unwrapping url")}
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        try configureParametersAndHeaders(parameters: parameters, headers: headers, request: &request)
        return request
    }
    
    static func configureParametersAndHeaders(parameters: [String: Any]?,
                                              headers: [String: String]?,
                                              request: inout URLRequest) throws {
        do {
            if let headers = headers, let parameters = parameters {
                try Encoder.encodeParameters(for: &request, with: parameters)
                try Encoder.setHeaders(for: &request, with: headers)
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
    
    
}
