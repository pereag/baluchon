//
//  Screens.swift
//  Le baluchon
//
//  Created by Valc0d3 on 29/10/2021.
//
import UIKit

final class Screens {
    
    //MARK: - Properties
    
    let storyBoard = UIStoryboard(name:"Main", bundle: Bundle(for: Screens.self));
}

//MARK: - Changes rate

extension Screens {
    func createsChangeRateViewController() -> UIViewController {
        let client = HTTPClient()
        let parser = JSONParser()
        let repository = ChangeRateRepository(client: client, parser: parser)
        let viewModel = ChangeRateViewModel(repository: repository)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "ChangeRateViewController") as! ChangeRateViewController
        viewController.viewModel = viewModel
        return viewController
    }
}

//MARK: - Translation

extension Screens {
    func createsTranslateViewController() -> UIViewController {
        let client = HTTPClient()
        let parser = JSONParser()
        let repository = TranslateRepository(client: client, parser: parser)
        let viewModel = TranslateViewModel(repository: repository)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "TranslateViewController") as! TranslateViewController
        viewController.viewModel = viewModel
        return viewController
    }
}

//MARK: - Weather Forecast

extension Screens {
    func WeatherViewController() -> UIViewController {
        let client = HTTPClient()
        let parser = JSONParser()
        let repository = WeatherRepository(client: client, parser: parser)
        let viewModel = WeatherViewModel(repository: repository)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
