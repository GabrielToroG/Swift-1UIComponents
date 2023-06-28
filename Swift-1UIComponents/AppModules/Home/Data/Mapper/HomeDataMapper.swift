//
//  HomeDataMapper.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-06-23.
//

import Foundation

protocol HomeDataMapper {
    func dataToDomain(_ value: DataHomeOptions) -> DomainHomeOptions
}
