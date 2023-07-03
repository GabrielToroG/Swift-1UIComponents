//
//  HomeViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import Foundation
import Combine

class HomeViewModel: BaseViewModel {
    var homeOptionsSubject = PassthroughSubject<UiHomeOptions, Error>()
    
    let getHomeOptionsUseCases: GetHomeOptionsUseCases
    init(getHomeOptionsUseCases: GetHomeOptionsUseCases) {
        self.getHomeOptionsUseCases = getHomeOptionsUseCases
    }
    
    func onViewDidLoad() {
        self.isLoading.send(true)
        getHomeOptionsUseCases.execute(()) { result in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                if case .success(let new) = result {
                    self.isLoading.send(false)
                    let uiHomeOptions = new
                    self.homeOptionsSubject.send(uiHomeOptions)
                }
                
            }
            
        }
    }



    
    func test() {
        self.isLoading.send(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.isLoading.send(false)
        }
    }
}
