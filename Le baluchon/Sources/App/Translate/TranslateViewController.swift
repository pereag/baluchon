//
//  TranslateViewController.swift
//  Le baluchon
//
//  Created by Valc0d3 on 29/10/2021.
//

import UIKit

final class TranslateViewController: UIViewController {
    var viewModel: TranslateViewModel!
    // MARK: - Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var frenchLabel: UILabel!
    
    @IBOutlet weak var frenchField: UITextView!
    
    @IBOutlet weak var englishLabel: UILabel!
    
    @IBOutlet weak var englishField: UITextView!
    
    @IBOutlet weak var translateButton: UIButton!
    
    // MARK: - View life cycles
    
    // MARK: - ACTIONS
    
    
    @IBAction func didPressTranslateButton(_ sender: UIButton) {
    }
    
    

}
