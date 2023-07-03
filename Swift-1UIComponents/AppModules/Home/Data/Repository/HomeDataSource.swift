//
//  HomeDataSource.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-06-23.
//

import Foundation

protocol HomeDataSource {
//    func getHomeOptions() async throws -> DomainHomeOptions
    func getHomeOptions(completion: @escaping (Result<DomainHomeOptions, Error>) -> Void)

}
