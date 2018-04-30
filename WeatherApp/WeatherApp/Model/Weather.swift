//
//  Weather.swift
//  WeatherApp
//
//  Created by Nuri Chun on 4/27/18.
//  Copyright © 2018 tetra. All rights reserved.
//

import Foundation

struct Weather: Codable
{
    let daily: Daily
}

struct Daily: Codable
{
    let forecasts: [Forecast]?
    
    enum CodingKeys: String, CodingKey {
        case forecasts = "data"
    }
}

struct Forecast: Codable
{
    let description: String
    let weatherType: String
    let temperature: Double
    let date: Int
    
    enum CodingKeys: String, CodingKey {
        case description = "summary"
        case weatherType = "icon"
        case temperature = "temperatureHigh"
        case date = "time"
    }
}

