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
    func createsTranslateViewController() ->  UIViewController {
        return UIViewController()
    }
}

//MARK: - Weather Forecast

extension Screens {
    func createsWeatherForecastViewController() ->  UIViewController {
        return UIViewController()
    }
}
