//
//  WeatherTableViewController.swift
//  Weather
//
//  Created by Nischal Hada on 6/19/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController, AddCitiesDelegate {
  
    // MARK: - Segues
    enum Segues: String {
        case showDetail = "toDetailViewController"
        case saveAddCity = "toAddCitiesViewController"
        case historical = "toHistoricalViewController"
        case objectivecInfo = "objectivecInfo"

    }
    var arrayWeather: [City] = [City]()
    var progressHUD: ProgressHUD { return ProgressHUD() }

    var viewModel: HomeViewModelProtocol = HomeViewModel()
    let addImageProg=UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.setupViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupAddImageUI()
    }


    private func setupAddImageUI(){
        let currentWindow: UIWindow? = UIApplication.shared.keyWindow

        addImageProg.image="plus.app.fill".toSystemImage
        addImageProg.tintColor=DesignSystem.Colors.helper.color
        addImageProg.addImage()
        currentWindow?.addSubview(self.addImageProg)
        self.addImageProg.addTapGesture { [ self] in
            self.performSegue(withIdentifier: "toAddCitiesViewController", sender: nil)

        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addImageProg.removeFromSuperview()
    }
    func setupViewModel() {
        self.viewModel.weatherList.bindAndFire { [weak self] cities in
            
            DispatchQueue.main.async {
                self?.arrayWeather = cities
                self?.tableView.reloadData()
            }
        }
        self.viewModel.isFinished.bindAndFire { [weak self] isTrue in
            if isTrue {
                self?.progressHUD.DismissSVProgressHUD()
            } else {
                self?.progressHUD.ShowSVProgressHUD_Black()
            }
        }
        self.viewModel.onErrorHandling = { [weak self] error in
            self?.showAlert(title: "An error occured", message: error?.localizedDescription)
        }
    }

    func setUpUI() {
        self.title = "Cities"
        self.view.backgroundColor = .clear
        self.tableView.backgroundColor = .clear
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.backgroundView = UIImageView(image: "Background".toImage)
        setupAddImageUI()
    }

    func methodAddCities(_ data: CityListModel) {
        viewModel.addCityToLocal(data: data)
        
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayWeather.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell else {
            fatalError("WeatherCell not found")
        }
        cell.WeatherModel = arrayWeather[indexPath.row]
        cell.histoyImageClicked={[self]in
            self.performSegue(withIdentifier: "toHistoricalViewController", sender: indexPath)
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayWeather.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            viewModel.removeCityFromLocal(data: arrayWeather[indexPath.row])
        }
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

            case .saveAddCity:
                self.prepareSegueForAddWeatherVC(segue: segue)
                break

            case .historical:
                self.prepareSegueForHistoricalVC(segue: segue, sender: sender)
                break
                
            case .historical:
                self.prepareSegueForHistoricalVC(segue: segue, sender: sender)
                break
                
            case .objectivecInfo:

                break
            }

        } else {
            fatalError("segue not found")
        }
    }
}

extension HomeTableViewController {

    private func prepareSegueForWeatherDetailVC(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let indexPath = sender as? IndexPath,
            let controller = segue.destination as? WeatherDetailViewController
        {
            controller.weatherData = self.arrayWeather[indexPath.row]
        }
    }

    private func prepareSegueForHistoricalVC(segue: UIStoryboardSegue, sender: Any?) {
        if
            let indexPath = sender as? IndexPath,
            let navigationController = segue.destination as? UINavigationController,
            let vc = navigationController.viewControllers.first as? HistoricalCityViewController
        {
            vc.city = self.arrayWeather[indexPath.row]
        } else {
            fatalError("NavigationController not found")
        }
    }

    private func prepareSegueForAddWeatherVC(segue: UIStoryboardSegue) {
        if
            let navigationController = segue.destination as? UINavigationController,
            let CitiesVC = navigationController.viewControllers.first as? AddCitiesViewController
        {
            CitiesVC.delegate = self
        } else {
            fatalError("NavigationController not found")
        }
    }
}
