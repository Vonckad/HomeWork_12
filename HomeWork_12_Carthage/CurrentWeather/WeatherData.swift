//
//  Weather.swift
//  HomeWork_12_Carthage
//
//  Created by Vlad Ralovich on 6/13/20.
//  Copyright © 2020 Vonkad. All rights reserved.
//

import Foundation

struct Weather: Codable {
    var main: String
    var description: String
}

struct Main: Codable {
    var temp: Double = 0.0
}

struct WeatherData: Codable {
    
    var weather: [Weather] = []
    var main: Main = Main()
    var name: String = ""
}
