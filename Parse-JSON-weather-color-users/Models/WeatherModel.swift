//
//  WeatherModel.swift
//  Parse-JSON-weather-color-users
//
//  Created by Liana Norman on 8/27/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct WeatherArray: Codable {
    let list: [City]
    
    static func getCities(from data: Data) throws -> [City] {
        do {
            let cities = try
                JSONDecoder().decode(WeatherArray.self, from: data)
            return cities.list
        } catch {
            throw JSONError.decodingError(error)
        }
    }
    
}

struct City: Codable {
    let name: String
    let main: MainWrapper
    let weather: [WeatherWrapper]
    
    
    
}

struct MainWrapper: Codable {
    let temp: Double
}

struct WeatherWrapper: Codable {
    let description: String
}

