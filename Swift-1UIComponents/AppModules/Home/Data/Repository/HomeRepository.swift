//
//  HomeRepository.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 10-07-24.
//

import Foundation

class HomeRepository: HomeDataSource {

    private let remote: HomeRemoteDataSource
    private let local: HomeLocalDataSource
    private let mapper: HomeDataMapper

    init(
        remote: HomeRemoteDataSource,
        local: HomeLocalDataSource,
        mapper: HomeDataMapper
    ) {
        self.remote = remote
        self.local = local
        self.mapper = mapper
    }

    func getMenuOptions(
        appName: DomainHomeMenuRequest,
        onCompletion: @escaping (ApiResult<DomainHomeMenu>) -> Void
    ) {
        remote.getMenuOptions(appName: mapper.domainToData(appName)) { [mapper] in
            onCompletion($0.map(mapper.dataToDomain))
        }
    }

    func getLocalMenuOptions() -> DomainHomeMenu? {
        guard let homeOptions = local.getMenuOptions() else { return nil }
        return mapper.dataToDomain(homeOptions)
    }

    func saveLocalMenuOptions(_ menu: ApiHomeMenu) {
        local.saveMenuOptions(menu)
    }
}
