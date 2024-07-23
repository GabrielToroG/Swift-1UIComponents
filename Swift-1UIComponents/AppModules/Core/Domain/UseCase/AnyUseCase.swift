//
//  AnyUseCase.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 23-07-24.
//

import Foundation

class AnyUseCase<RequestType, ResultType>: UseCase {

    private let executeClosure: (RequestType) -> ApiResult<ResultType>

    init<T: UseCase>(_ useCase: T) where
        T.RequestType == RequestType,
        T.ResultType == ResultType {
        self.executeClosure = useCase.execute
    }

    func execute(_ parameters: RequestType) -> ApiResult<ResultType> {
        return self.executeClosure(parameters)
    }
}
