//
//  Service.swift
//  WeatherApp
//
//  Created by Nuri Chun on 4/29/18.
//  Copyright © 2018 tetra. All rights reserved.
//

import Foundation
import CoreLocation

struct Service
{
    static let sharedInstance = Service()
    
    
    // Implement a function that takes in a location
    // How to do it?
    // https://api.darksky.net/forecast/[key]/[latitude],[longitude]
    
    let basePath = "https://api.darksky.net/forecast/30a76ecd6b56f2d54ab17bac08d52ae2/"
    
    func fetchJSON(withLocation location: CLLocationCoordinate2D, completion: @escaping (Weather?, Error?) -> Void)
    {
        print("2")
        
        let fullPath = basePath + "\(location.latitude),\(location.longitude)"
        
        let request = URLRequest(url: URL(string: fullPath)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data , response, error) in
            
            if let error = error {
                print("Not able to fetch json",error)
                return
            }
            
            guard let jsonData = data else { return }
            
            do {
                print("4")
                guard let weather = try? JSONDecoder().decode(Weather.self, from: jsonData) else { return }
                
                completion(weather, nil)
            }
        }
        task.resume()
        
        print("3")
    }
    
    
}
