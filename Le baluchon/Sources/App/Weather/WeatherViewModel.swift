//
//  WeatherViewModel.swift
//  Le baluchon
//
//  Created by Valc0d3 on 29/10/2021.
//

import Foundation

final class WeatherViewModel {

    // MARK: - Properties

    let actions: Actions

    private let repository: WeatherRepositoryType
    
    private let cityTargeted : String

    private var name: String = "" {
        didSet {
            self.getName?(name)
        }
    }
    
    private var temp: Double = 0 {
        didSet {
            self.getTemp?(temp)
        }
    }
    
    private var tempMin: Double = 0 {
        didSet {
            self.getTempMin?(tempMin)
        }
    }
    
    private var tempMax: Double = 0 {
        didSet {
            self.getTempMax?(tempMax)
        }
    }
    
    private var humidity: Int = 0 {
        didSet {
            self.getHumidity?(humidity)
        }
    }

    struct Actions {
        var displayCityName: (String) -> Void
        var displayCityTemp: (Double) -> Void
        var displayCityTempMin: (Double) -> Void
        var displayCityTempMax: (Double) -> Void
        var displayCityHumidity: (Int) -> Void
    }

    // MARK: - Initializer

    init(actions: Actions, repository: WeatherRepositoryType, cityTargeted: String) {
        self.actions = actions
        self.repository = repository
        self.cityTargeted = cityTargeted
    }

    // MARK: - Outputs
    var getName: ((String) -> Void)?
    var getTemp: ((Double) -> Void)?
    var getTempMin: ((Double) -> Void)?
    var getTempMax: ((Double) -> Void)?
    var getHumidity: ((Int) -> Void)?

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
            case .failure(let error):
                self?.getName?("")
                self?.getTemp?(0)
                self?.getTempMin?(0)
                self?.getTempMax?(0)
                self?.getHumidity?(0)
                print(error)
            }
        }
    }

    func returnAllInfo() {
        let cityName = self.name
        let cityTemp = self.temp
        let cityTempMin = self.tempMin
        let cityTempMax = self.tempMin
        let cityHumidity = self.humidity
        actions.displayCityName(cityName)
        actions.displayCityTemp(cityTemp)
        actions.displayCityTempMin(cityTempMin)
        actions.displayCityTempMax(cityTempMax)
        actions.displayCityHumidity(cityHumidity)
    }
}
