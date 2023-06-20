//
//  BaseViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import Foundation
import Combine

open class BaseViewModel {
    public init() {
    }
    public final var isLoading = PassthroughSubject<Bool, Error>()
    public final var isTopToast = PassthroughSubject<Bool, Error>()
}
