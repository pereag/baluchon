//
//  ViewCoordinator.swift
//  Le baluchon
//
//  Created by Valc0d3 on 31/10/2021.
//

import Foundation
import UIKit

final class FlowCoordinator {
    
    // MARK: - Properties
    
    private let presenter:UIWindow
    private let screens: Screens
    
    
    // MARK: - Start
    
    init(presenter: UIWindow) {
        self.presenter = presenter
        self.screens = Screens()
    }
    
    func start() {
        let ChangeRateViewController = screens.createsChangeRateViewController()
        presenter.rootViewController = ChangeRateViewController
    }
}