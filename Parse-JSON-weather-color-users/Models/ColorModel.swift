//
//  ColorModel.swift
//  Parse-JSON-weather-color-users
//
//  Created by Liana Norman on 8/27/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation


struct Color: Codable {
    let name: ColorNameWrapper
    let hex: String
    let rgb: rgbWrapper
    
    static func getColors(from data: Data) throws -> [Color] {
        do {
            let colors = try
                JSONDecoder().decode([Color].self, from: data)
            return colors
        } catch {
            throw JSONError.decodingError(error)
        }
    }
}

struct rgbWrapper: Codable {
    let fraction: FractionWrapper
}

struct FractionWrapper: Codable {
    let r: Double
    let g: Double
    let b: Double
}

struct ColorNameWrapper: Codable {
    let value: String
}
