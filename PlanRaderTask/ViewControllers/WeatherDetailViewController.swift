//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by Nischal Hada on 6/19/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
   
    @IBOutlet private weak var cityInfoLabel: UILabel!
    @IBOutlet private weak var weatherStatusImage: UIImageView!
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var windSpeed: UILabel!



    var weatherData: City?
    var viewModel: WeatherDetailViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        self.setupUI()
    }

    func setupUI() {
        self.navigationItem.title = weatherData?.name
        self.view.backgroundColor = UIColor.viewBackgroundColor
    }
    func setupUIFromModel(model:WeatherInformation?) {
        self.tempratureLabel.text = model?.name
    }
   
    func setupViewModel() {
        self.viewModel = WeatherDetailViewModel(withWeatherInformation: weatherData)
        self.viewModel?.cityWeather.bindAndFire { [weak self] weatherInformation in
            DispatchQueue.main.async {
                self?.setupUIFromModel(model: weatherInformation)
            }
        }
        self.viewModel?.onErrorHandling = { [weak self] error in
            self?.showAlert(title: "An error occured", message: error?.localizedDescription)
        }
    }
}
