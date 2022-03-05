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
        let date=Date()
        self.cityInfoLabel.setCityInfoData(name: model?.name,date: date.getTimeStringFromDate)
        self.weatherStatusImage.image=UIImage(named: WeatherImageProvider().provideValue(model?.weather?[0].main ?? ""))
        print("🙄 \(model?.name)")

        self.descriptionLabel.setDescription(model?.weather?[0].main ?? "")
        self.tempLabel.setTemp(model?.main?.temp)
        self.humidityLabel.setHumidity(model?.main?.humidity)
        self.windSpeed.setWindSpeed(model?.wind?.speed)


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
