//
//  AddCityViewModel.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//
import Foundation

class AddCityViewModel: AddCityViewModelProtocol {
    
    let cityListModel: Dynamic<[CityListModel]>
    let isFinished: Dynamic<Bool>
    var onErrorHandling: ((ErrorResult?) -> Void)?
    let vc:AddCitiesViewController
    private let cityListHandler: CityListHandlerProtocol!
    
    init(withCityListHandler cityListHandler: CityListHandlerProtocol = CityListHandler(),vc:AddCitiesViewController) {
        self.cityListHandler = cityListHandler
        
        self.cityListModel = Dynamic([])
        self.isFinished = Dynamic(false)
        self.vc=vc
        self.fetchCityInfo()
    }
    func addCityAndDismiss() {
        
    }
    
    private func fetchCityInfo() {
        DispatchQueue.global(qos: .userInteractive).async {
            self.cityListHandler.fetchCityInfo(withfileName: "citylist") { [weak self] result in
                DispatchQueue.main.async {
                    self?.isFinished.value = true
                    switch result {
                    case .success(let list) :
                        self?.cityListModel.value = list
                        break
                    case .failure(let error) :
                        print("Parser error \(error)")
                        self?.onErrorHandling?(error)
                        break
                    }
                }
            }
        }
    }
}
