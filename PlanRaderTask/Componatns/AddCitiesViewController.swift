//
//  AddCitiesViewController.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import UIKit

protocol AddCitiesDelegate {
    func methodAddCities(_ data: CityListModel)
}

class AddCitiesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var cityList: [CityListModel] = [CityListModel]()
    var filteredList: [CityListModel] = [CityListModel]()
    var delegate: AddCitiesDelegate?
    var searchActive: Bool = false
    var progressHUD: ProgressHUD { return ProgressHUD() }
    
    var viewModel: AddCityViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.setupViewModel()
    }
    
    func setupViewModel() {
        viewModel=AddCityViewModel(vc:self)
        self.viewModel.cityListModel.bindAndFire { [weak self] list in
            DispatchQueue.main.async {
                self?.cityList = list
                self?.filteredList = list
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
            self?.showAlert(title: "An error occured", message: "Oops, something went wrong!")
        }
    }
    
    func setUpUI() {
        self.title = "Add City"
        self.view.backgroundColor = UIColor.viewBackgroundColor
        self.tableView.backgroundColor = UIColor.tableViewBackgroundColor
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.navigationController?.presentThemeNavigationBar()
    }
    
    @IBAction func actionCancel(_ sender: AnyObject) {
        self.progressHUD.DismissSVProgressHUD()
        self.pop()
    }
    
    @IBAction func actionSave(_ sender: AnyObject) {}
    
}

// MARK: - UISearchBarDelegate Setup
extension AddCitiesViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // searchActive = false;
        self.searchBarSearchBegin(searchBar)
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchActive = true
    }
    
    func searchBarSearchBegin(_ searchBar: UISearchBar) {
        let strText: String =  searchBar.text!.replacingOccurrences(of: " ", with: "")
        if (strText ).isEmpty {
            searchActive = false
        } else {
            self.progressHUD.ShowSVProgressHUD_Black()
            
            DispatchQueue.main.async {
                self.filteredList.removeAll()
                let foundItems = self.cityList.filter { (($0.name?.range(of: strText)) != nil) || $0.id == Int(strText) }
                self.filteredList =  foundItems
                self.searchActive = true
                self.tableView.reloadData()
                self.progressHUD.DismissSVProgressHUD()
            }
        }
    }
}

extension AddCitiesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddCitiesCell", for: indexPath) as? AddCitiesCell else {
            fatalError("AddCitiesCell not found")
        }
        cell.addCitiesModel = filteredList[indexPath.row]
        return cell
    }
}

extension AddCitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = filteredList[indexPath.row]
        if let delegate = self.delegate {
            delegate.methodAddCities(city)
            self.pop()
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
