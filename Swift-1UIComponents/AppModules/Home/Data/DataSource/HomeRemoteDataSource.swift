//
//  HomeRemoteDataSource.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-06-23.
//

import Foundation

protocol HomeRemoteDataSource {
    func getHomeOptions(completion: @escaping (Result<DataHomeOptions, Error>) -> Void)
}
