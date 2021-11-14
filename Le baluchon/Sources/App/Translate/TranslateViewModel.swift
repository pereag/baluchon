//
//  TranslateViewModel.swift
//  Le baluchon
//
//  Created by Valc0d3 on 29/10/2021.
//

import Foundation

final class TranslateViewModel {

    // MARK: - Properties

    let actions: Actions

    private let repository: TranslateRepositoryType
    
    private let phrase : String

    private var phraseTranslated: String = "" {
        didSet {
            self.getPhraseTranslated?(phraseTranslated)
        }
    }

    struct Actions {
        var displayPhraseTranslated: (String) -> Void
    }

    // MARK: - Initializer

    init(actions: Actions, repository: TranslateRepositoryType, phrase: String) {
        self.actions = actions
        self.repository = repository
        self.phrase = phrase
    }

    // MARK: - Outputs
    var getPhraseTranslated: ((String) -> Void)?

    // MARK: - Inputs

    func viewDidLoad() {
        repository.getTranslation(for: self.phrase) { [weak self] result in
            switch result {
            case .success(let response):
                self?.phraseTranslated = response.data.translations[0].translatedText
            case .failure(let error):
                self?.getPhraseTranslated?("")
                print(error)
            }
        }
    }

    func returnAllInfo() {
        let phraseTranslated = self.phraseTranslated
        actions.displayPhraseTranslated(phraseTranslated)
    }
}
