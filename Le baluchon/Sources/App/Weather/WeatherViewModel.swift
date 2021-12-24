//
//  WeatherViewModel.swift
//  Le baluchon
//
//  Created by Valc0d3 on 29/10/2021.
//

import Foundation

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
    var tempMinText1: ((String) -> Void)?
    var tempMaxText1: ((String) -> Void)?
    var humidityText1: ((String) -> Void)?
    var descriptionText1: ((String) -> Void)?
    
    var nameText2: ((String) -> Void)?
    var tempText2: ((String) -> Void)?
    var tempMinText2: ((String) -> Void)?
    var tempMaxText2: ((String) -> Void)?
    var humidityText2: ((String) -> Void)?
    var descriptionText2: ((String) -> Void)?

    // MARK: - Inputs

    func viewDidLoad() {
        initData()
        getData()
    }

    private func initData() {
        nameText1?("Lyon")
        tempText1?("Temp :")
        tempMinText1?("Temp min :")
        tempMaxText1?("Temp max :")
        humidityText1?("Humidité :")
        descriptionText1?("Description :")
        
        nameText2?("New York")
        tempText2?("Temp :")
        tempMinText2?("Temp min :")
        tempMaxText2?("Temp max :")
        humidityText2?("Humidité :")
        descriptionText2?("Description :")
    }

    private func getData() {
        repository.getWeatherInfo(for: Constants.cityOne) { [weak self] result in
            switch result {
            case .success(let response):
                self?.nameText1?(response.name)
                self?.tempText1?("Temp : \(response.main.temp) degré")
                self?.tempMinText1?("Temp min : \(response.main.tempMin) degré")
                self?.tempMaxText1?("Temp max : \(response.main.tempMin) degré")
                self?.humidityText1?("Humidité : \(response.main.humidity)%")
                if response.weather.indices.contains(2) {
                    self?.descriptionText1?("\(response.weather[2])")
                } else {
                    self?.descriptionText1?("Aucune description disponible.")
                }
            case .failure(let error):
                print(error)
            }
        }
        repository.getWeatherInfo(for: Constants.cityTwo) { [weak self] result in
            switch result {
            case .success(let response):
                self?.nameText2?(response.name)
                self?.tempText2?("Temp : \(response.main.temp) degré")
                self?.tempMinText2?("Temp min : \(response.main.tempMin) degré")
                self?.tempMaxText2?("Temp max : \(response.main.tempMin) degré")
                self?.humidityText2?("Humidité : \(response.main.humidity)%")
                if response.weather.indices.contains(2) {
                    self?.descriptionText2?("\(response.weather[2])")
                } else {
                    self?.descriptionText2?("Aucune description disponible.")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
