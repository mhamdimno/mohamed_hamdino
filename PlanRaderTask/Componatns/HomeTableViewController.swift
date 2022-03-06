//
//  WeatherTableViewController.swift
//  Weather
//
//  Created by Nischal Hada on 6/19/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController, AddCitiesDelegate {
  
    var arrayWeather: [City] = [City]()
    var progressHUD: ProgressHUD { return ProgressHUD() }

    var viewModel: HomeViewModelProtocol!
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

        addImageProg.image="add".toImage
        addImageProg.tintColor=DesignSystem.Colors.helper.color
        addImageProg.addImage()
        currentWindow?.addSubview(self.addImageProg)
        self.addImageProg.addTapGesture { [ self] in
            viewModel.goToAddCity()
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addImageProg.removeFromSuperview()
    }
    func setupViewModel() {
        self.viewModel=HomeViewModel(vc:self)
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
            viewModel.goToHistorical(model: arrayWeather[safe:indexPath.row])
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
        print("🙄id \(arrayWeather[safe:indexPath.row]?.id)")

        viewModel.goToDetails(model: arrayWeather[safe:indexPath.row])
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return KtableViewHeight
    }

   
}
