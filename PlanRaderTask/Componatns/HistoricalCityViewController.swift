//
//  HistoricalCityViewController.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import UIKit

class HistoricalCityViewController: UITableViewController {
    
    var progressHUD: ProgressHUD { return ProgressHUD() }
    
    var city : City?
    var viewModel: HistoricalCityViewModel?
    private var weatherInfoList: [WeatherInfo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        self.setUpUI()
    }
    
    
    func setupViewModel() {
        
        self.viewModel = HistoricalCityViewModel( withWeatherInformation: city, vc: self)
        
        self.viewModel?.weatherList.bindAndFire { [weak self] array in
            DispatchQueue.main.async {
                self?.weatherInfoList = array
                self?.tableView.reloadData()
            }
        }
        self.viewModel?.onErrorHandling = { [weak self] error in
            self?.showAlert(title: "An error occured", message: error?.localizedDescription)
        }
    }
    
    func setUpUI() {
        self.title = "\(city?.name ?? "") Historical"
        self.tableView.backgroundColor = UIColor.tableViewBackgroundColor
        self.view.backgroundColor = UIColor.viewBackgroundColor
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherInfoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoricalCityCell", for: indexPath) as? HistoricalCityCell else {
            fatalError("WeatherCell not found")
        }
        cell.WeatherInfoModel = weatherInfoList[indexPath.row]
        
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let city=city{
            self.viewModel?.goToWeatherDetails(model: city)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return KtableViewHeight
    }
}
