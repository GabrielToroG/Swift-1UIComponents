//
//  HomeRemoteDataSource.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 10-07-24.
//

import Foundation

protocol HomeRemoteDataSource {
    func getMenuOptions(
        appName: ApiHomeMenuRequest,
        completion: @escaping(ApiResult<ApiHomeMenu>) -> Void
    )
}
