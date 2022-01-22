//
//  ChangeRateViewModel.swift
//  Le baluchon
//
//  Created by Valc0d3 on 29/10/2021.
//

import Foundation

final class ChangeRateViewModel {
    
    // MARK: - Properties
    
    private let repository: ChangeRateRepositoryType
    
    // MARK: - Initializer
    
    init(repository: ChangeRateRepositoryType) {
        self.repository = repository
    }
    
    // MARK: - Outputs
    
    var displayedResult: ((String) -> Void)?
    var displayedAlert: ((AlertContent) -> Void)?
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        displayedResult?("")
    }
    
    func didPressChangeRate(for value: String) {
        if !value.isEmpty {
            guard let doubleValue = Double(value) else { return }
            repository.gateRate() { [weak self] result in
                switch result {
                case .success(let response):
                    self?.handle(response, with: doubleValue)
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
               message: "Le champs euros est vide.",
               cancelTitle: "Ok"
            )
            self.displayedAlert?(alertContent)
        }
    }
    
    private func handle(_ response: ChangeRateResponse, with value: Double) {
        let usd = response.rates.usd
        let result = usd * value
        self.displayedResult?("\(result)")
    }
}
