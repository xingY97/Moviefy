//
//  AuthenticationTokenResponse.swift
//  Moviefy
//
//  Created by X Y on 5/11/21.
//

import Foundation

struct AuthenticationTokenResponse: Codable {
    let success: Bool
    let expires_at: String
    let request_token: String
}
