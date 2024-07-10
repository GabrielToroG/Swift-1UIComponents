//
//  BaseViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import Foundation
import Combine

open class BaseViewModel {

    // Combine
    private(set) var isLoadingSubject = PassthroughSubject<Bool, Never>()
    var isLoadingPublisher: AnyPublisher<Bool, Never> {
        isLoadingSubject.eraseToAnyPublisher()
    }

    // Init
    public init() {}

    // Lifecycle
    func onViewDidLoad() {
        print("Current ViewModel: \(type(of: self))")
    }

    func onViewWillAppear() {}
}
