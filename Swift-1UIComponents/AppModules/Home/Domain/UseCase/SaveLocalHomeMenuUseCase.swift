//
//  SaveLocalHomeMenuUseCase.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 15-07-24.
//

import Foundation

final class SaveLocalHomeMenuUseCase: UseCase {
    typealias RequestType = DomainHomeMenu
    typealias ResultType = Bool
    typealias Alias = AnyUseCase<RequestType, ResultType>

    let repository: HomeDataSource
    let mapper: HomeDomainMapper

    init(
        repository: HomeDataSource,
        mapper: HomeDomainMapper
    ) {
        self.repository = repository
        self.mapper = mapper
    }

    func execute(_ parameters: RequestType) -> ApiResult<ResultType> {
        repository.saveMenuOptions(mapper.domainToData(parameters))
        return .success(data: true)
    }
}
