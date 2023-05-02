//
//  HomeViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import Foundation
import Combine

class HomeViewModel: BaseViewModel {
    func test() {
        self.isLoading.send(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.isLoading.send(false)
        }
    }
}
