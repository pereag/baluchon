//
//  ChangeRateViewController.swift
//  Le baluchon
//
//  Created by Valc0d3 on 29/10/2021.
//

import UIKit

final class ChangeRateViewController: UIViewController {
    var viewModel: ChangeRateViewModel!
    
    // MARK: - Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var eurosLabel: UILabel!
    
    @IBOutlet weak var eurosField: UITextField!
    
    @IBOutlet weak var dollarLabel: UILabel!
    
    @IBOutlet weak var dollarField: UITextField!
    
    @IBOutlet weak var converterButton: UIButton!
    
    // MARK: - View life cycles
    override func viewDidLoad() {
        dollarField.isUserInteractionEnabled = false
    }
    
    // MARK: - ACTIONS
    
    @IBAction func didPressConverterButton(_ sender: UIButton) {
    }
}
