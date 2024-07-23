//
//  HomeLocalDataSource.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 15-07-24.
//

import Foundation

protocol HomeLocalDataSource {
    func getMenuOptions() -> ApiHomeMenu?
    func saveMenuOptions(_ menu: ApiHomeMenu)
}
