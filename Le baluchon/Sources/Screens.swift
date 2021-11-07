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
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        return vc
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
