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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var eurosLabel: UILabel!
    
    @IBOutlet weak var eurosField: UITextField! {
        didSet { eurosField?.addDoneCancelToolbar() }
    }
    
    @IBOutlet weak var dollarLabel: UILabel!
    
    @IBOutlet weak var dollarField: UITextField!
    
    @IBOutlet weak var converterButton: UIButton!
    
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
    
    @IBAction func didPressConverterButton(_ sender: UIButton) {
        viewModel.didPressChangeRate(for: eurosField.text!)
    }
}
