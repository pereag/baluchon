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
    
    var displayedAlert: ((AlertContent) -> Void)?
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        translatedText?("")
    }
    
    func didPress(translate text: String) {
        if !text.isEmpty {
            repository.getTranslation(for: text) { [weak self] result in
                switch result {
                case .success(let response):
                    self?.handle(response)
                    print(response)
                case .failure(let error):
                    let alertContent = AlertContent(
                       title: "Alert",
                       message: "Une erreur est survenue, veuillez réessayer plus tard.",
                       cancelTitle: "Ok"
                    )
                    self?.displayedAlert?(alertContent)
                    print(error)
                }
            }
        } else {
            let alertContent = AlertContent(
               title: "Alert",
               message: "Le champs francais est vide.",
               cancelTitle: "Ok"
            )
            self.displayedAlert?(alertContent)
        }
    }
    
    private func handle(_ response: TranslateResponse) {
        guard response.data.translations.indices.contains(0) else { return }
        self.translatedText?(response.data.translations[0].translatedText)
    }
}
