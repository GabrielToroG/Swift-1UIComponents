//
//  ClosureUseCase.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 04-07-24.
//

import Foundation

/// Usado para las peticiones API o cualquier Remote data source
protocol ClosureUseCase {
    associatedtype RequestType
    associatedtype ResultType

    func execute(
        _ parameters: RequestType,
        _ onCompletion: @escaping (ApiResult<ResultType>) -> Void
    )
}
