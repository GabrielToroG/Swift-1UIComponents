//
//  ViewsViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 04-03-24.
//

import Foundation

final class ViewsViewModel: BaseViewModel {

    @Published private(set) var goTo: ViewsCoordinator.GoToScene?
    @Published private(set) var isActive: Bool = false
}

extension ViewsViewModel {
    func toggleIsActive() {
        isActive.toggle()
    }
}

extension ViewsViewModel {
    func showAlert() {
        self.goTo = .showAlert
    }

    func presentBottomShet() {
        let args = ModalFeedbackArgs(title: "XD")
        self.goTo = .modalFeedback(args)
    }
}
