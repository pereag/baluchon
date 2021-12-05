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
    
    private let cityTargeted : String

    private var name: String = "" {
        didSet {
            self.nameText?(name)
        }
    }
    
    private var temp: Double = 0 {
        didSet {
            self.tempText?("\(temp)")
        }
    }
    
    private var tempMin: Double = 0 {
        didSet {
            self.tempMinText?("\(tempMin)")
        }
    }
    
    private var tempMax: Double = 0 {
        didSet {
            self.tempMaxText?("\(tempMax)")
        }
    }
    
    private var humidity: Int = 0 {
        didSet {
            self.humidityText?("\(humidity)")
        }
    }
    
    private var description: String = "" {
        didSet {
            self.descriptionText?(description)
        }
    }
    
    // MARK: - Initializer

    init(repository: WeatherRepositoryType, cityTargeted: String) {
        self.repository = repository
        self.cityTargeted = cityTargeted
    }

    // MARK: - Outputs

    var nameText: ((String) -> Void)?
    var tempText: ((String) -> Void)?
    var tempMinText: ((String) -> Void)?
    var tempMaxText: ((String) -> Void)?
    var humidityText: ((String) -> Void)?
    var descriptionText: ((String) -> Void)?

    // MARK: - Inputs

    func viewDidLoad() {
        repository.getWeatherInfo(for: self.cityTargeted) { [weak self] result in
            switch result {
            case .success(let response):
                self?.name = response.name
                self?.temp = response.main.temp
                self?.tempMin = response.main.tempMin
                self?.tempMax = response.main.tempMin
                self?.humidity = response.main.humidity
                self?.description = ("\(response.weather[2])")
            case .failure(let error):
                self?.name = ""
                self?.temp = 0
                self?.tempMin = 0
                self?.tempMax = 0
                self?.humidity = 0
                self?.description = ""
                print(error)
            }
        }
    }
}
