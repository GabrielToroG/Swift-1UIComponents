//
//  HomeDataSource.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 10-07-24.
//

import Foundation

protocol HomeDataSource {
    func getMenuOptions(
        appName: DomainHomeMenuRequest,
        onCompletion: @escaping (ApiResult<DomainHomeMenu>) -> Void
    )
}
