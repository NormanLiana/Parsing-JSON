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
