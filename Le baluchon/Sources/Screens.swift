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

extension Screens {
    func createsChangeRateViewController() -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        return vc
    }
}

extension Screens {
    func createsTranslateViewController() ->  UIViewController {
        return UIViewController()
    }
}

extension Screens {
    func createsMeteoViewController() ->  UIViewController {
        return UIViewController()
    }
}
