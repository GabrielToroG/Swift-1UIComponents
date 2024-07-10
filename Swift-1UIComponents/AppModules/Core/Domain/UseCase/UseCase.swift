//
//  UseCase.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 04-07-24.
//

import Foundation

/// Usado para la información local o cualquier Local data source
protocol UseCase: Reusable {
    associatedtype RequestType
    associatedtype ResultType

    func execute(
        _ parameters: RequestType
    ) -> ApiResult<ResultType>
}
