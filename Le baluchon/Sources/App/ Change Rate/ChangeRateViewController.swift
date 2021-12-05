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
    
    @IBOutlet weak var textTitle: UILabel!
    
    @IBOutlet weak var textEuros: UILabel!
    
    @IBOutlet weak var textDollar: UILabel!
    
    @IBOutlet weak var fieldEuros: UITextField!
    
    @IBOutlet weak var fieldDollar: UITextField!
    
    // MARK: - View life cycles
    override func viewDidLoad() {
        fieldDollar.isUserInteractionEnabled = false
    }
    
    // MARK: - ACTIONS
    
    @IBAction func didPressConverterButton(_ sender: UIButton) {
      
    }
}
