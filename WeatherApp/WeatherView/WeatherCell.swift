//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Nuri Chun on 4/28/18.
//  Copyright © 2018 tetra. All rights reserved.
//

import UIKit
import Foundation

class WeatherCell: UICollectionViewCell
{
    var forecast: Forecast? {
        didSet {
            guard let forecast = forecast else { return }
            
            self.weatherTypeLabel.text = "  \(forecast.weatherType.uppercased())  "
            self.descriptionLabel.text = forecast.description
//            self.temperatureLabel.text = "\(forecast.temperature)"
            self.temperatureLabel.text = String(format: "%.f", forecast.temperature)
            self.weather()
            self.setupForecast(date: forecast.date)
        }
    }
    
    let forecastImage: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "SunWithCloud")
//        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40 / 2
        
        return imageView
    }()
    
    var weatherTypeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.rgb(red: 237, green: 173, blue: 173)
        label.layer.borderColor = UIColor.rgb(red: 222, green: 191, blue: 191).cgColor
        label.textColor = UIColor.rgb(red: 191, green: 48, blue: 48)
        label.clipsToBounds = true
        label.numberOfLines = 0
        label.contentMode = .center
        label.layer.cornerRadius = 20 / 2
        label.layer.borderWidth = 1.5
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
//        label.backgroundColor = UIColor.orange
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.textAlignment = .center
        label.textColor = UIColor.white

        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
//        label.backgroundColor = UIColor.yellow
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.rgb(red: 237, green: 173, blue: 173)
        label.text = "  MONDAY  "
        label.layer.borderColor = UIColor.rgb(red: 222, green: 191, blue: 191).cgColor
        label.textColor = UIColor.rgb(red: 191, green: 48, blue: 48)
        label.clipsToBounds = true
        label.numberOfLines = 0
        label.contentMode = .center
        label.layer.cornerRadius = 20 / 2
        label.layer.borderWidth = 1.5
        label.font = UIFont.boldSystemFont(ofSize: 18)

        return label
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        setupImageAndLabels()
    }
    
    // MARK: - SetupImageAndLabels
    
    private func setupImageAndLabels()
    {
        addSubview(forecastImage)
        forecastImage.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topPad: 0, leftPad: 0, bottomPad: 0, rightPad: 0, width: frame.width, height: 200)
        
        addSubview(weatherTypeLabel)
        weatherTypeLabel.anchor(top: nil, left: leftAnchor, bottom: forecastImage.bottomAnchor, right: nil, topPad: 0, leftPad: 4, bottomPad: 4, rightPad: 0, width: 0, height: 40)
        
        addSubview(temperatureLabel)
        temperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        temperatureLabel.anchor(top: nil, left: nil, bottom: bottomAnchor, right: nil, topPad: 50, leftPad: 100, bottomPad: 95, rightPad: 100, width: 170, height: 100)
        
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topPad: 4, leftPad: 4, bottomPad: 4, rightPad: 4, width: 0, height: 40)
        
        addSubview(dateLabel)
        dateLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, topPad: 4, leftPad: 0, bottomPad: 0, rightPad: 4, width: 0, height: 40)
    }
    
    private func setupForecast(date: Int)
    {
        let dateFormatter = DateFormatter()
        let date = Date(timeIntervalSinceReferenceDate: Double(date))
        
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMd")
        
        self.dateLabel.text = " \(dateFormatter.string(from: date)) "
    }

    
    // MARK: - Setup Switch Statement For WeatherType Permutations
    @discardableResult private func weather() -> UIImage?
    {
        switch forecast?.weatherType {
        case "clear-day":
            self.forecastImage.image = UIImage(named: "clearWeather")
            return self.forecastImage.image
        case "clear-night":
            self.forecastImage.image = UIImage(named: "clearNightWeather")
            return self.forecastImage.image
        case "rain":
            self.forecastImage.image = UIImage(named: "rainWeather")
            return self.forecastImage.image
        case "snow":
            self.forecastImage.image = UIImage(named: "snowWeather")
            return self.forecastImage.image
        case "sleet":
            self.forecastImage.image = UIImage(named: "sleetWeather")
            return self.forecastImage.image
        case "wind":
            self.forecastImage.image = UIImage(named: "windyWeather")
            return self.forecastImage.image
        case "fog":
            self.forecastImage.image = UIImage(named: "fogWeather")
            return self.forecastImage.image
        case "cloudy":
            self.forecastImage.image = UIImage(named: "cloudyWeather")
            return self.forecastImage.image
        case "partly-cloudy-day":
            self.forecastImage.image = UIImage(named: "partlyCloudyWeather1")
            return self.forecastImage.image
        case "partly-cloudy-night":
            self.forecastImage.image = UIImage(named: "partlyCloudyNightWeather")
            return self.forecastImage.image
        case "thunderstorm":
            self.forecastImage.image = UIImage(named: "thunderWeather")
            return self.forecastImage.image
        default:
            return UIImage(named: "partyCloudWeather")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



