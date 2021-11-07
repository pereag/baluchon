//
//  RequestCancellationToken.swift
//  Le baluchon
//
//  Created by Valc0d3 on 08/10/2021.
//

import Foundation

final class RequestCancellationToken {

    init() {}

    deinit {
        willDeallocate?()
    }

    var willDeallocate: (() -> Void)?
}

