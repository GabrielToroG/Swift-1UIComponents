//
//  HomeRemoteDataSourceImpl.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 10-07-24.
//

import Foundation

final class HomeRemoteDataSourceImpl: HomeRemoteDataSource {

    private let manager: NetworkManager

    init(manager: NetworkManager) {
        self.manager = manager
    }

    func getMenuOptions(
        appName: ApiHomeMenuRequest,
        completion: @escaping(ApiResult<ApiHomeMenu>) -> Void
    ) {
        let endpoint = "/home/\(appName.app)"
        manager.request(
            endpoint: endpoint,
            method: .GET,
            headerType: .authenticated,
            onCompletion: completion)
    }
}
