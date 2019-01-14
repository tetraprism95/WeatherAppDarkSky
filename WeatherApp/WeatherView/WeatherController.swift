//
//  ViewController.swift
//  WeatherApp
//
//  Created by Nuri Chun on 4/25/18.
//  Copyright © 2018 tetra. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate
{
    let cellId = "cellId"
    
    let searchBarHeight: CGFloat = 50.0
    var dailyForecasts = [Forecast]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        collectionView?.backgroundColor = UIColor.rgb(red: 156, green: 134, blue: 134)
        collectionView?.register(WeatherCell.self, forCellWithReuseIdentifier: cellId)
        
        setupNavigationBar()
        setupSearchBar()
    }
    
    private func setupSearchBar()
    {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: searchBarHeight))
        searchBar.placeholder = "Enter State/City"
        
        searchBar.delegate = self
        
        self.collectionView?.addSubview(searchBar)
    }
    
    private func setupNavigationBar()
    {
        navigationItem.title = "Eight Day Forecast"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.rgb(red: 191, green: 48, blue: 48)]
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.rgb(red: 191, green: 48, blue: 48)]
    }
    
    private func updateWeather(forLocation location: String)
    {
        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
            
            if error == nil {
                if let location = placemarks?.first?.location {
                    
                    self.collectionView?.reloadData()
                    
                    Service.sharedInstance.fetchJSON(withLocation: location.coordinate) { (weather, error) in
                        DispatchQueue.main.async {
                            if let weather = weather {
                                self.dailyForecasts = (weather.daily.forecasts) ?? []
                                self.collectionView?.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
}

// MARK: - CollectionViewDataSource

extension WeatherController
{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return dailyForecasts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! WeatherCell
        
        cell.backgroundColor = UIColor.rgb(red: 117, green: 108, blue: 108)
        
        cell.forecast = dailyForecasts[indexPath.row]
        
        return cell
    }
}

// MARK: - CollectionViewDelegateFlowLayout

extension WeatherController
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: view.frame.width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.bounds.height, height: searchBarHeight)
    }
}

// MARK: - UISearchBarDelegate

extension WeatherController
{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
        // Checks first if there is a text, then if the string is not empty then execute the statement.
        if let locationString = searchBar.text, !locationString.isEmpty
        {
            self.updateWeather(forLocation: locationString)
        }
    }
}



