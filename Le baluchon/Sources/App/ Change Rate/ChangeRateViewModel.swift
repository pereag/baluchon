//
//  ChangeRateViewModel.swift
//  Le baluchon
//
//  Created by Valc0d3 on 29/10/2021.
//

import Foundation

final class ChangeRateViewModel {

    // MARK: - Properties

    let repository: ChangeRateRepositoryType

    // MARK: - Init

    init(repository: ChangeRateRepositoryType) {
        self.repository = repository
    }

    //func didPressButton() {
     //   repository.exchangeToDollar(euroValue: 12, completion: { [weak self] result in
       //     switch result {
        //    case .success(let value):
        //        print(value)
         //   case .failure(let error):
        //        print(error)
        //    }
       // })
    //}
}
