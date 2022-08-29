//
//  WeatherManager.swift
//  Clima
//
//  Created by Hanif Fadillah Amrynudin on 30/07/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=a1faa9b0d55de0551810719a5bca6491&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(CityName: String) {
        
        let urlString = "\(weatherURL)&q=\(CityName)"
        performRequest(with: urlString)
        
    }
    
    func fetchWeather( latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
        
    }
    
    func performRequest(with urlString: String) {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:err:))
            
            // 4. Start the task
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, err: Error?) {
        if err != nil {
            delegate?.didFailWithError(error: err!)
            return
        }
        
        if let safeData = data {
            if let weather = parseJSON(safeData) {
                delegate?.didUpdateWeather(self, weather: weather)
            }
        }
    }
    
    func parseJSON(_ wheaterData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: wheaterData)
            
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, nameCity: name, temperature: temp)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
