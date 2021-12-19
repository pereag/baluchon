//
//  TranslateViewController.swift
//  Le baluchon
//
//  Created by Valc0d3 on 29/10/2021.
//

import UIKit

final class TranslateViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: TranslateViewModel!
    
    // MARK: - Outlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var frenchLabel: UILabel!
    @IBOutlet weak var frenchField: UITextView!
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var englishField: UITextView!
    @IBOutlet weak var translateButton: UIButton!
    
    // MARK: - View life cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.viewDidLoad()
    }

    private func bind() {
        viewModel.translatedText = { [weak self] text in
            self?.englishField.text = text
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func didPressTranslateButton(_ sender: UIButton) {
        guard let text = frenchField.text else { return }
        viewModel.didPress(translate: text)
    }
}
