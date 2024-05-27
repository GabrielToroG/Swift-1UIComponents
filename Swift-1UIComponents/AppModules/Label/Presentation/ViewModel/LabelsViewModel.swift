//
//  LabelsViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import Foundation

final class LabelsViewModel: BaseViewModel {
    @Published private(set) var numbers: [Int] = []
    @Published private(set) var numbersTwo: [Int] = []

    override func onViewDidLoad() {
        super.onViewDidLoad()
        numbers = [1, 2, 3, 4]
        numbersTwo = [11, 12, 13, 14]
    }
}
