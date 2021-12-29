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
        initTabBarDesign()
    }
    
    private func initTabBarDesign() {
        let tabBarItem1 = self.tabBarController.tabBar.items?[0]
        tabBarItem1?.title = "Taux de change"
        tabBarItem1?.image = UIImage(systemName: "dollarsign.circle.fill")
        
        let tabBarItem2 = self.tabBarController.tabBar.items?[1]
        tabBarItem2?.title = "Traduction"
        tabBarItem2?.image = UIImage(systemName: "character.book.closed.fill.ja")
        
        let tabBarItem3 = self.tabBarController.tabBar.items?[2]
        tabBarItem3?.title = "Météo"
        tabBarItem3?.image = UIImage(systemName: "cloud.sun.fill")
    }
}
