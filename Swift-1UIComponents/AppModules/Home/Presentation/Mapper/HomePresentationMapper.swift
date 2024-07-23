//
//  HomePresentationMapper.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 14-07-24.
//

import Foundation

protocol HomePresentationMapper {
    func format(_ value: [UiHomeOption]) -> [UiHomeOptionCorrect]
    func presentationToDomain(_ value: UiHomeMenu) -> DomainHomeMenu
}
