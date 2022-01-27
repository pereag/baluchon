//
//  ChangeRateViewController.swift
//  Le baluchon
//
//  Created by Valc0d3 on 29/10/2021.
//

import UIKit

final class ChangeRateViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: ChangeRateViewModel!
    
    // MARK: - Outlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var eurosLabel: UILabel!
    
    @IBOutlet private weak var eurosField: UITextField! {
        didSet { eurosField?.addDoneCancelToolbar() }
    }
    
    @IBOutlet private weak var dollarLabel: UILabel!
    
    @IBOutlet private weak var dollarField: UITextField!
    
    @IBOutlet private weak var converterButton: UIButton!
    
    // MARK: - View life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        eurosField.delegate = self
        self.hideKeyboardWhenTappedAround()
        bind()
        viewModel.viewDidLoad()
    }
    
    private func setupUI() {
        dollarField.isUserInteractionEnabled = false
    }
    
    private func bind() {
        viewModel.displayedResult = { [weak self] text in
            DispatchQueue.main.async {
                self?.dollarField.text = text
            }
        }
        viewModel.displayedAlert = { [weak self] alertContent in
            DispatchQueue.main.async {
                self?.presentAlert(content: alertContent)
            }
        }
    }
    
    // MARK: - ACTIONS
    
    @IBAction private func didPressConverterButton(_ sender: UIButton) {
        viewModel.didPressChangeRate(for: eurosField.text!)
    }
}
