//
//  WeatherLoader.swift
//  HomeWork_12_Carthage
//
//  Created by Vlad Ralovich on 6/13/20.
//  Copyright © 2020 Vonkad. All rights reserved.
//

import Foundation

class WeatherLoader {
    
    var weatherData = WeatherData()
    
    func loadWeather(completion: @escaping (WeatherData) -> Void) {
        
        let myUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Moscow&lang=ru&units=metric&appid=c54f405569613556a8b049e8058b8be2")!

        let request = URLRequest(url: myUrl)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("error1")
                return
            }
            do {
                self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
                DispatchQueue.main.async {
                    completion(self.weatherData)
                }

            } catch {
                print("error2")
            }
        }
            task.resume()
    }
}
