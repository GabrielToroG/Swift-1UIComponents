//
//  HomeRepository.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-06-23.
//

import Foundation

class HomeRepository: HomeDataSource {
    private let remote: HomeRemoteDataSource
    private let mapper: HomeDataMapper
    
    init(remote: HomeRemoteDataSource, mapper: HomeDataMapper) {
        self.remote = remote
        self.mapper = mapper
    }

    func getHomeOptions(completion: @escaping (Result<DomainHomeOptions, Error>) -> Void) {
        remote.getHomeOptions { [weak self] result in
            guard let self = self else { return }
            completion(result.map(self.mapper.dataToDomain(_:)))
        }
    }
    
//    func getHomeOptions() async throws -> DomainHomeOptions {
//        let dataHomeOptions = try await remote.getHomeOptions()
//        return mapper.dataToDomain(dataHomeOptions)
//    }
}
