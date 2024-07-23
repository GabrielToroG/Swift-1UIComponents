//
//  HomeDomainMapper.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 10-07-24.
//

import Foundation

protocol HomeDomainMapper {
    func presentationToDomain(_ value: UIHomeMenuRequest) -> DomainHomeMenuRequest
    func domainToPresentation(_ value: DomainHomeMenu) -> UiHomeMenu
    func domainToData(_ value: DomainHomeMenu) -> ApiHomeMenu
}

