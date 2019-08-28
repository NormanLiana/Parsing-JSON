//
//  RandomUserModel.swift
//  Parse-JSON-weather-color-users
//
//  Created by Liana Norman on 8/27/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

enum JSONError: Error {
    case decodingError(Error)
}

struct User: Codable {
    let name: NameWrapper
    let email: String
    let location: LocationWrapper
    let phone: String
    let dob: DateOfBirth
    
    static func getUsers(from data: Data) throws -> [User] {
        do {
            let users = try
                JSONDecoder().decode([User].self, from: data)
            return users
        } catch {
            throw JSONError.decodingError(error)
        }
    }
}

struct NameWrapper: Codable {
    let first: String
    let last: String
    
    func fullyNamed() -> String {
        return "\(first) \(last)"
    }
}

struct LocationWrapper: Codable {
    let street: String
    let city: String
    let state: String
   // let postcode: Int
    
    func fullAddress() -> String {
        return "\(street) \(city), \(state)"
    }
}

struct DateOfBirth: Codable {
    let date: String
}
