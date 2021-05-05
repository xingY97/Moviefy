//
//  APIClient.swift
//  Moviefy
//
//  Created by X Y on 5/5/21.
//

import Foundation

struct APIClient {
    static let shared = APIClient()
    let session = URLSession(configuration: .default)
}

