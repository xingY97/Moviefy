//
//  Account.swift
//  Moviefy
//
//  Created by X Y on 5/11/21.
//

import Foundation
struct Account: Codable {
    let id: Int
    let name: String?
    let username: String?
    
    var displayName: String {
        if let name = name, !name.isEmpty {
            return name
        }
        return username ?? "(uknown)"
    }
}
