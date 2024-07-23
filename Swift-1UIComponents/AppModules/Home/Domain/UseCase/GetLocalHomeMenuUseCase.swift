//
//  GetLocalHomeMenuUseCase.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 23-07-24.
//

import Foundation

final class GetLocalHomeMenuUseCase: UseCase {
    typealias RequestType = Void?
    typealias ResultType = UiHomeMenu?
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
        var homeMenu: UiHomeMenu?
        if let aux = repository.getLocalMenuOptions() {
            print(L10n.Home.getMenuMessage)
            homeMenu = mapper.domainToPresentation(aux)
        }
        return .success(data: homeMenu)
    }
}
