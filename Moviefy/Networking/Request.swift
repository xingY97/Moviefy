//
//  Request.swift
//  Moviefy
//
//  Created by X Y on 5/5/21.
//

import Foundation

public enum HTTPMethod: String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public enum Route: String{
    case movies = "discover/movie"
    case token = "authentication/token/new"
    case session = "authentication/session/new"
    case account = "account"
}

struct Request {
    
    public static let baseImageURL = URL(string: "https://image.tmdb.org/t/p/w500")!
    
    static let headers = [
        "Accept":"Application/json",
        "Content-Type":"Applicatoin/json",
        "Authorization": " Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlODc2ZDkyMjIyZjVlMjVkYmNhMGZhOTk0ZDRiYWZhZCIsInN1YiI6IjYwOTMxNTA5NzY0NmZkMDA3Nzk2OTIwMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._8DfzJ7U6oum5nlmSk5gnHQqcO-WTB_aLs4giZLPUi0"
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
