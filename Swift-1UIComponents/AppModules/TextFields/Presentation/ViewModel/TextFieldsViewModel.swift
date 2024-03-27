//
//  TextFieldsViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 25-03-24.
//

import Foundation
import Combine

class TextFieldsViewModel: BaseViewModel {
    @Published private(set) var goTo: TextFieldsCoordinator.GoToScene?
}

extension TextFieldsViewModel {
    func goToLabeledView() {
        goTo = .labeledView
    }
}
