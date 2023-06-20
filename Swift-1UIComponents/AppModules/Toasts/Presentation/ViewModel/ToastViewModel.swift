//
//  ToastViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 04-06-23.
//

import Foundation

class ToastViewModel: BaseViewModel {
    // MARK: -
    // MARK: -
    func showLoading() {
        self.isTopToast.send(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.isTopToast.send(false)
        }
    }
}
