//
//  GetHomeOptionsUseCases.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-06-23.
//

import Foundation

final class GetHomeOptionsUseCases: BaseUseCase {
    typealias RequestType = Void
    typealias ResultType = UiHomeOptions

    let repository: HomeDataSource
    let mapper: HomeDomainMapper
    
    init(repository: HomeDataSource, mapper: HomeDomainMapper) {
        self.repository = repository
        self.mapper = mapper
    }

    func execute(_ parameters: Void) async throws -> UiHomeOptions {
        let domainHomeOptions = try await repository.getHomeOptions()
        return mapper.domainToPresentation(domainHomeOptions)
    }
}
