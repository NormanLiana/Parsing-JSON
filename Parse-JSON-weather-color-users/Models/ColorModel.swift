//
//  ColorModel.swift
//  Parse-JSON-weather-color-users
//
//  Created by Liana Norman on 8/27/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct ColorArray: Codable {
    var colors: [Color]
    
}

struct Color: Codable {
    let name: ColorNameWrapper
    let hex: HexWrapper
    let rgb: rgbWrapper
    
    static func getColors(from data: Data) throws -> [Color] {
        do {
            let colors = try
                JSONDecoder().decode(ColorArray.self, from: data)
            return colors.colors
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

struct HexWrapper: Codable {
    let value: String
}
