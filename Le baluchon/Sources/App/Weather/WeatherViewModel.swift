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
        nameText1?("")
        tempText1?("")
        tempMinText1?("")
        tempMaxText1?("")
        humidityText1?("")
        descriptionText1?("")
        
        nameText2?("")
        tempText2?("")
        tempMinText2?("")
        tempMaxText2?("")
        humidityText2?("")
        descriptionText2?("")
    }

    private func getData() {
        repository.getWeatherInfo(for: Constants.cityOne) { [weak self] result in
            switch result {
            case .success(let response):
                self?.nameText1?(response.name)
                self?.tempText1?("\(response.main.temp)")
                self?.tempMinText1?("\(response.main.tempMin)")
                self?.tempMaxText1?("\(response.main.tempMin)")
                self?.humidityText1?("\(response.main.humidity)")
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
                self?.tempText2?("\(response.main.temp)")
                self?.tempMinText2?("\(response.main.tempMin)")
                self?.tempMaxText2?("\(response.main.tempMin)")
                self?.humidityText2?("\(response.main.humidity)")
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
