//
//  Coordinator.swift
//  Le baluchon
//
//  Created by Valc0d3 on 29/10/2021.
//

import UIKit

final class Coordinator {
    
    // MARK: - Properties
    
    private unowned var appDelegate: AppDelegate
    private var flowCoordinator: FlowCoordinator?
    
    //MARK: - Init
    
    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }

    //MARK: - Start

    func start() {
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window!.rootViewController = UIViewController()
        appDelegate.window!.makeKeyAndVisible()
        
        showFlow()
    }
    
    private func showFlow() {
        flowCoordinator = FlowCoordinator(presenter: appDelegate.window!)
        flowCoordinator?.start()
    }
}
