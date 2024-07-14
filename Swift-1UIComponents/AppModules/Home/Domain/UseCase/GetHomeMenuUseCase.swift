//
//  GetHomeMenuUseCase.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 10-07-24.
//

import Foundation

final class GetHomeMenuUseCase: ClosureUseCase {

    typealias RequestType = UIHomeMenuRequest
    typealias ResultType = UiHomeMenu
    typealias Alias = AnyClosureUseCase<RequestType, ResultType>

    let repository: HomeDataSource
    let mapper: HomeDomainMapper

    init(
        repository: HomeDataSource,
        mapper: HomeDomainMapper
    ) {
        self.repository = repository
        self.mapper = mapper
    }

    func execute(
        _ parameters: RequestType,
        _ onCompletion: @escaping (ApiResult<UiHomeMenu>) -> Void
    ) {
        repository.getMenuOptions(appName: mapper.presentationToDomain(parameters)) { [weak self] in
            guard let self = self else { return }
            onCompletion($0.map(self.mapper.domainToPresentation(_:)))
        }
    }
}
