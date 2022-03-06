//
//  PersistanceManager.swift
//  RelationCoreData
//
//  Created by Diffa Desyawan on 16/06/21.
//

import Foundation
import CoreData


class PersistanceManager {
    static let shared = PersistanceManager()
    
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "PlanRaderTask")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func setCity(data: CityListModel?,weatherInformation: WeatherInformation?) {
        print("🙄name \(data?.name)")
        print("🙄deg \(weatherInformation?.wind?.deg)")

       let city = City(context: persistentContainer.viewContext)
        city.id = Int64(data?.id ?? 0)
        city.name = data?.name ?? ""
        save()
        setWeatherInfo(weatherInformation: weatherInformation, city: city)
        save()
    }
    
    func setWeatherInfo(weatherInformation: WeatherInformation?, city: City) {
        let weatherInfo = WeatherInfo(context: persistentContainer.viewContext)
        let currentDate=Date()
        weatherInfo.date = currentDate.getTimeStringFromDate

        weatherInfo.id = Int64(weatherInformation?.id ?? 0)
        weatherInfo.degree = "\(weatherInformation?.main?.temp ?? 0)"
        weatherInfo.statue = weatherInformation?.weather?[0].main ?? ""
        weatherInfo.city = city
        save()
    }
    
    func fetchCitys() -> [City] {
        let request: NSFetchRequest<City> = City.fetchRequest()
        var citys: [City] = []
        do {
            citys = try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Error fetching citys")
        }
        
        return citys
    }
    
    func deleteCity(city : City) {
        persistentContainer.viewContext.delete(city)
        save()
    }
    
    func deleteWeatherInfo(weatherInfo: WeatherInfo) {
        persistentContainer.viewContext.delete(weatherInfo)
        save()
    }
    
    func fetchWeatherInfo(city: City) -> [WeatherInfo] {
        let request: NSFetchRequest<WeatherInfo> = WeatherInfo.fetchRequest()
        
        request.predicate = NSPredicate(format: "(city = %@)", city)
        
       // request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        var weatherInfos: [WeatherInfo] = []
        
        do{
            weatherInfos = try persistentContainer.viewContext.fetch(request)
        }catch {
            print("Error fetching weatherInfos data")
        }
        return weatherInfos
    }
    
    func save () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
