//
//  WeatherViewModel.swift
//  Le baluchon
//
//  Created by Valc0d3 on 29/10/2021.
//

import UIKit

final class WeatherViewModel {
    
    // MARK: - Properties
    
    private let repository: WeatherRepositoryType
    
    private struct Constants {
        static let cityOne = "Lyon"
        static let cityTwo = "New York"
    }
    
    // MARK: - Initializer
    
    init(repository: WeatherRepositoryType) {
        self.repository = repository
    }
    
    // MARK: - Outputs
    
    var primaryTitleText = "Météo"
    var nameText1: ((String) -> Void)?
    var tempText1: ((String) -> Void)?
    var humidityText1: ((String) -> Void)?
    var descriptionText1: ((String) -> Void)?
    
    var nameText2: ((String) -> Void)?
    var tempText2: ((String) -> Void)?
    var humidityText2: ((String) -> Void)?
    var descriptionText2: ((String) -> Void)?
    
    var displayedAlert: ((AlertContent) -> Void)?
    var isLoading: ((Bool) -> Void)?
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        initData()
        getData()
    }
    
    private func initData() {
        nameText1?("Lyon")
        tempText1?("Temp :")
        humidityText1?("Humidité :")
        descriptionText1?("Description :")
        
        nameText2?("New York")
        tempText2?("Temp :")
        humidityText2?("Humidité :")
        descriptionText2?("Description :")
    }
    
    private func getData() {
        isLoading?(true)
        repository.getWeatherInfo(for: Constants.cityOne) { [weak self] result in
            //self?.isLoading(false)
            switch result {
            case .success(let response):
                self?.nameText1?(response.name)
                self?.tempText1?("Temp : \(String(describing: response.main.temp))°c")
                self?.humidityText1?("Humidité : \(response.main.humidity)%")
                self?.descriptionText1?("Description : \(response.weather[0].weatherDescription)")
            case .failure(let error):
                let alertContent = AlertContent(
                   title: "Alert",
                   message: "Une erreur est survenue, veuillez réessayer plus tard. ",
                   cancelTitle: "Ok"
                )
                self?.displayedAlert?(alertContent)
                print(error)
            }
        }
        repository.getWeatherInfo(for: Constants.cityTwo) { [weak self] result in
            switch result {
            case .success(let response):
                self?.nameText2?(response.name)
                self?.tempText2?("Temp : \(String(describing: response.main.temp))°c")
                self?.humidityText2?("Humidité : \(response.main.humidity)%")
                self?.descriptionText2?("Description : \(response.weather[0].weatherDescription)")
            case .failure(let error):
                let alertContent = AlertContent(
                   title: "Alert",
                   message: "Une erreur est survenue, veuillez réessayer plus tard.",
                   cancelTitle: "Ok"
                )
                self?.displayedAlert?(alertContent)
                print(error)
            }
        }
    }
}
