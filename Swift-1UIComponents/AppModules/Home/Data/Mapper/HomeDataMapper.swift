//
//  HomeDataMapper.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 10-07-24.
//

import Foundation

protocol HomeDataMapper {
    func domainToData(_ value: DomainHomeMenuRequest) -> ApiHomeMenuRequest
    func dataToDomain(_ value: ApiHomeMenu) -> DomainHomeMenu
}
