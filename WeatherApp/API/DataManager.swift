//
//  DataManager.swift
//  WeatherApp
//
//  Created by Nuri Chun on 4/26/18.
//  Copyright © 2018 tetra. All rights reserved.
//

import Foundation

enum DataMangerError: Error
{
    case FailedRequest
    case UnknownRequest
    case InvalidResponse
}

final class DataManger
{
    typealias WeatherDataCompletion = ((Any?, DataMangerError?) -> Void)
    
    let baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    // MARK: - Requesting Data
    
    private func weatherForLocation(latitude: Double, longitude: Double, completion: @escaping WeatherDataCompletion)
    {
        // 1. GET FULL URL
        let url = baseURL.appendingPathComponent("\(latitude),\(longitude)")
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(DataMangerError.FailedRequest)
            }
            
            if let response = response {
                print(response)
            }
        }
    }
}
