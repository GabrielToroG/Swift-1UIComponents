//
//  BaseUseCase.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-06-23.
//

import Foundation

protocol BaseUseCase {
    associatedtype RequestType
    associatedtype ResultType

    func execute(
        _ parameters: RequestType,
        _ onCompletion: @escaping (Result<ResultType, Error>) -> Void
    )
}
