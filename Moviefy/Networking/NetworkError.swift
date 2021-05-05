//
//  NetworkError.swift
//  Moviefy
//
//  Created by X Y on 5/5/21.
//

import Foundation

public enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil"
    case encodingDailed = "Parameter Encoding failed"
    case decodingFailed = "Unable to decode data"
    case missingURL = "the URL is nil"
    case couldNotParse = "Unable to parse the JSON response"
    case noData = "Data is nil"
    case fragmentResponse = "Response's body has fragments"
    case authenticationError = "You must be authenticated"
    case badRequest = "Bad request"
    case pageNotFound = "Page not found"
    case failed = "Request failed"
    case serverError = "Server error"
    case noResponse = "No response"
    case success = "Success"
}
