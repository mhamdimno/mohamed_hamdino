//
//  HistoricalCityViewController.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import UIKit

class HistoricalCityViewController: UITableViewController {


    // MARK: - Segues
    enum Segues: String {
        case showDetail = "toDetailViewController"
    }
    var progressHUD: ProgressHUD { return ProgressHUD() }

    var city : City?
    private var weatherInfoList: [WeatherInfo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.setupViewModel()
    }

    func setupViewModel() {
        if let city = city {
            print("🙄name \(city.name)")

            load()
        }
//        self.viewModel.weatherList.bindAndFire { [weak self] cities in
//            DispatchQueue.main.async {
//              //  self?.arrayWeather = cities
//                self?.tableView.reloadData()
//            }
//        }
//        self.viewModel.isFinished.bindAndFire { [weak self] isTrue in
//            if isTrue {
//                self?.progressHUD.DismissSVProgressHUD()
//            } else {
//                self?.progressHUD.ShowSVProgressHUD_Black()
//            }
//        }
//        self.viewModel.onErrorHandling = { [weak self] error in
//            self?.showAlert(title: "An error occured", message: error?.localizedDescription)
//        }
    }
    private func load(){
        guard let city = city else {
            return
        }
        
        weatherInfoList = PersistanceManager.shared.fetchWeatherInfo(city: city)
        print("🙄date \(weatherInfoList.first?.date)")

        tableView.reloadData()
    }
    func setUpUI() {
        self.title = "Weather Information"
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
        self.performSegue(withIdentifier: "toDetailViewController", sender: indexPath)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return KtableViewHeight
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let identifier = segue.identifier,
            let segueValue = Segues(rawValue: identifier)
        {

            switch segueValue {
            case .showDetail:
                self.prepareSegueForWeatherDetailVC(for: segue, sender: sender)
            default:
                break
            }

        } else {
            fatalError("segue not found")
        }
    }
}

extension HistoricalCityViewController {

    private func prepareSegueForWeatherDetailVC(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let indexPath = sender as? IndexPath,
            let controller = segue.destination as? WeatherDetailViewController
        {
            controller.weatherData = city
        }
    }

    
}
