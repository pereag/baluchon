//
//  TranslateViewModel.swift
//  Le baluchon
//
//  Created by Valc0d3 on 29/10/2021.
//

import Foundation

final class TranslateViewModel {

    // MARK: - Properties
    
    private let repository: TranslateRepositoryType
    
    // MARK: - Initializer

    init(repository: TranslateRepositoryType) {
        self.repository = repository
    }

    // MARK: - Outputs
    
    let translateButtonTitle = "Traduire"
    var translatedText: ((String) -> Void)?

    // MARK: - Inputs

    func viewDidLoad() {
        translatedText?("")
    }

    func didPress(translate text: String) {
        repository.getTranslation(for: text) { [weak self] result in
            switch result {
            case .success(let response):
                self?.handle(response)
            case .failure(let error):
                self?.translatedText?("Erreur: Une erreur de communication avec l'API est survenue")
                print(error)
            }
        }
    }

    private func handle(_ response: TranslateResponse) {
        guard response.data.translations.indices.contains(0) else { return }
        self.translatedText?(response.data.translations[0].translatedText)

//        guard let translation = response.data.translations.first else { return }
//        self.translatedText?(translation.translatedText)
    }
}
