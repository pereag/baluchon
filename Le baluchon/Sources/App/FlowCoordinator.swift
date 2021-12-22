//
//  ViewCoordinator.swift
//  Le baluchon
//
//  Created by Valc0d3 on 31/10/2021.
//

import UIKit

final class FlowCoordinator {
    
    // MARK: - Properties
    
    private let presenter: UIWindow
    private let screens: Screens
    private let tabBarController: UITabBarController
    
    // MARK: - Start
    
    init(presenter: UIWindow) {
        self.presenter = presenter
        self.screens = Screens()
        tabBarController = UITabBarController()
    }
    
    func start() {
        let viewControllers: [UIViewController] = [
            screens.createsChangeRateViewController(),
            screens.createsTranslateViewController(),
            screens.WeatherViewController()
        ]
        tabBarController.viewControllers = viewControllers
        presenter.rootViewController = tabBarController
    }
}
