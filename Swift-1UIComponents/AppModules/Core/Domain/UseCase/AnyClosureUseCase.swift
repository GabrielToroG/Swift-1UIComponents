//
//  AnyClosureUseCase.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 13-07-24.
//

import Foundation

class AnyClosureUseCase<RequestType, ResultType>: ClosureUseCase {

    private let call: (RequestType, @escaping (ApiResult<ResultType>) -> Void) -> Void

    init<T: ClosureUseCase>(_ useCase: T) where
        T.RequestType == RequestType,
        T.ResultType == ResultType {
        call = useCase.execute
    }

    public func execute(
        _ parameters: RequestType,
        _ onCompletion: @escaping (ApiResult<ResultType>) -> Void
    ) {
        call(parameters, onCompletion)
    }
}
