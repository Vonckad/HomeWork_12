//
//  AlamofireViewController.swift
//  HomeWork_12_Carthage
//
//  Created by Vlad Ralovich on 6/17/20.
//  Copyright © 2020 Vonkad. All rights reserved.
//

import UIKit

class AlamofireTableViewController: UITableViewController {

    @IBOutlet var headView: UIView!
    var myDailyDate = [Daily]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWeather()
        tableView.backgroundColor = UIColor.init(red: 74/255, green: 187/255, blue: 223/255, alpha: 1.0)
        tableView.register(DailyWeatherTableViewCell.nib(), forCellReuseIdentifier: "DailyWeatherTableViewCell")
    }
    
    func loadWeather() {
        AlamofireLoader().loadWeather {
            alamofireDate in
            let data = alamofireDate.daily
            self.myDailyDate.append(contentsOf: data)
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myDailyDate.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyWeatherTableViewCell", for: indexPath) as! DailyWeatherTableViewCell
        cell.configurate(with: self.myDailyDate[indexPath.row])

        return cell
    }
}
