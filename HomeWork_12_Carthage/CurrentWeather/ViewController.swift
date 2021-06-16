//
//  ViewController.swift
//  HomeWork_12_Carthage
//
//  Created by Vlad Ralovich on 6/10/20.
//  Copyright © 2020 Vonkad. All rights reserved.
//

import UIKit
import Gifu

class ViewController: UIViewController {
    
    var myWeatherData = WeatherData()
    
    @IBOutlet var nameTown: UILabel!
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    
    var nameGif: String = "3"
    var imageView = GIFImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateWeatherData()
        
        imageView = GIFImageView(frame: CGRect(x: 0, y: -100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        imageView.contentMode = .scaleAspectFit
        print("0 == ", nameGif)
        imageView.animate(withGIFNamed: nameGif)
        weatherImage.addSubview(imageView)
    }
    
    func updateWeatherData() {
        WeatherLoader().loadWeather {
            myWeatherData in
            
            self.nameTown.text = myWeatherData.name
            self.infoLabel.text = myWeatherData.weather[0].description
            self.tempLabel.text = String(myWeatherData.main.temp) + " ℃"
            self.nameGif = myWeatherData.weather[0].main
            
            print("1 == ", self.nameGif)

            switch self.nameGif{
            case "Clear": self.nameGif = "1"
            self.weatherImage.backgroundColor = UIColor.init(red: 232/255, green: 185/255, blue: 81/255, alpha: 1.0)
            case "Rain": self.nameGif = "2"
            self.weatherImage.backgroundColor = UIColor.init(red: 107/255, green: 81/255, blue: 232/255, alpha: 1.0)
            default: self.nameGif = "3"
            self.weatherImage.backgroundColor = UIColor.init(red: 109/255, green: 110/255, blue: 109/255, alpha: 1.0)
            }
            print("3 == ", self.nameGif)

            self.imageView.animate(withGIFNamed: self.nameGif)
            self.weatherImage.addSubview(self.imageView)
        }
    }
    
    @IBAction func reloadButton(_ sender: Any) {
        updateWeatherData()
    }
}
