//
//  HomeRemoteDataSourceImpl.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-06-23.
//

import Foundation

class HomeRemoteDataSourceImpl: HomeRemoteDataSource {
    private let manager: ServiceLayer
    init(manager: ServiceLayer) {
        self.manager = manager
    }

    func getHomeOptions(completion: @escaping (Result<DataHomeOptions, Error>) -> Void) {
        do {
            guard let homeOptions = manager.requestUsingMock(jsonName: "HomeOptions", model: DataHomeOptions.self) else {
                throw NetworkError.jsonDecoder
            }
            completion(.success(homeOptions))
        } catch {
            completion(.failure(error))
        }
    }
}
