//
//  WeatherViewController.swift
//  Le baluchon
//
//  Created by Valc0d3 on 29/10/2021.
//

import UIKit

final class WeatherViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: WeatherViewModel!
    
    // MARK: - Outlets
    
    @IBOutlet private weak var infoView: UIView!
    
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var city1Label: UILabel!
    
    @IBOutlet private weak var temp1Label: UILabel!
    
    @IBOutlet private weak var humidity1Label: UILabel!
    
    @IBOutlet private weak var descrition1Label: UILabel!
    
    @IBOutlet private weak var city2Label: UILabel!
    
    @IBOutlet private weak var temp2Label: UILabel!

    @IBOutlet private weak var humidity2Label: UILabel!
    
    @IBOutlet private weak var description2Label: UILabel!
    
    // MARK: - View life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.viewDidLoad()
        self.activityIndicatorManager()
        self.initUISwipeGestureRecognizer()
    }
    
    private func activityIndicatorManager() {
        viewModel.isLoading = { [weak self] isLoading in
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.alpha = 1
                    self?.infoView.alpha = 0
                } else {
                    self?.activityIndicator.alpha = 0
                    self?.infoView.alpha = 1
                }
            }
        }
    }
    
    private func initUISwipeGestureRecognizer() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    private func bind() {
        titleLabel.text = viewModel.primaryTitleText
        viewModel.nameText1 = { [weak self] text in
            DispatchQueue.main.async {
                self?.city1Label.text = text
            }
        }
        viewModel.tempText1 = { [weak self] text in
            DispatchQueue.main.async {
                self?.temp1Label.text = text
            }
        }
        viewModel.humidityText1 = { [weak self] text in
            DispatchQueue.main.async {
                self?.humidity1Label.text = text
            }
        }
        viewModel.descriptionText1 = { [weak self] text in
            DispatchQueue.main.async {
                self?.descrition1Label.text = text
            }
        }
        viewModel.nameText2 = { [weak self] text in
            DispatchQueue.main.async {
                self?.city2Label.text = text
            }
        }
        viewModel.tempText2 = { [weak self] text in
            DispatchQueue.main.async {
                self?.temp2Label.text = text
            }
        }
        viewModel.humidityText2 = { [weak self] text in
            DispatchQueue.main.async {
                self?.humidity2Label.text = text
            }
        }
        viewModel.descriptionText2 = { [weak self] text in
            DispatchQueue.main.async {
                self?.description2Label.text = text
            }
        }
        viewModel.displayedAlert = { [weak self] alertContent in
            DispatchQueue.main.async {
                self?.presentAlert(content: alertContent)
            }
            
        }
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .down:
                viewModel.didSwipeForRefresh()
            default:
                break
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func refreshGestureReconizer(_ sender: UIPanGestureRecognizer) {
    }
    
}
