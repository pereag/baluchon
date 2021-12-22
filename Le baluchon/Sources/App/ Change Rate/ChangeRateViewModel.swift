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

    // MARK: - Inputs

    func viewDidLoad() {
        displayedResult?("")
    }
    
    func didPressChangeRate(for value: String) {
        guard let doubleValue = Double(value) else { return }
        repository.gateRate() { [weak self] result in
            switch result {
            case .success(let response):
                self?.handle(response, with: doubleValue)
            case .failure(let error):
                self?.displayedResult?("Error")
                print(error)
            }
        }
    }

    private func handle(_ response: ChangeRateResponse, with value: Double) {
        let usd = response.rates.usd
        let result = usd * value
        self.displayedResult?("\(result)")
    }
}
