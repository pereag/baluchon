//
//  WeatherViewController.swift
//  Le baluchon
//
//  Created by Valc0d3 on 29/10/2021.
//

import UIKit

final class WeatherViewController: UIViewController {
    var viewModel: WeatherViewModel!
    
    // MARK: - Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var city1Label: UILabel!
    
    @IBOutlet weak var temp1Label: UILabel!
    
    @IBOutlet weak var tempMin1Label: UILabel!
    
    @IBOutlet weak var tempMax1Label: UILabel!
    
    @IBOutlet weak var humidity1Label: UILabel!
    
    @IBOutlet weak var descrition1Label: UILabel!
    
    @IBOutlet weak var city2Label: UILabel!
    
    @IBOutlet weak var temp2Label: UILabel!
    
    @IBOutlet weak var tempMin2Label: UILabel!
    
    @IBOutlet weak var tempMax2Label: UILabel!
    
    @IBOutlet weak var humidity2Label: UILabel!
    
    @IBOutlet weak var description2Label: UILabel!
    
    // MARK: - View life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        self.bind()
        self.titleLabel.text! = viewModel.primaryTitleText
    }
    
    private func bind() {
        viewModel.nameText1 = { [weak self] text in
            self?.city1Label.text = text
        }
        viewModel.tempText1 = { [weak self] text in
            self?.temp1Label.text = text
        }
        viewModel.tempMinText1 = { [weak self] text in
            self?.tempMin1Label.text = text
        }
        viewModel.tempMaxText1 = { [weak self] text in
            self?.tempMax1Label.text = text
        }
        viewModel.humidityText1 = { [weak self] text in
            self?.humidity1Label.text = text
        }
        viewModel.descriptionText1 = { [weak self] text in
            self?.descrition1Label.text = text
        }
        
        viewModel.nameText2 = { [weak self] text in
            self?.city2Label.text = text
        }
        viewModel.tempText2 = { [weak self] text in
            self?.temp2Label.text = text
        }
        viewModel.tempMinText1 = { [weak self] text in
            self?.tempMin1Label.text = text
        }
        viewModel.tempMaxText2 = { [weak self] text in
            self?.tempMax2Label.text = text
        }
        viewModel.humidityText2 = { [weak self] text in
            self?.humidity2Label.text = text
        }
        viewModel.descriptionText2 = { [weak self] text in
            self?.description2Label.text = text
        }
    }
    
    // MARK: - ACTIONS
    
}



