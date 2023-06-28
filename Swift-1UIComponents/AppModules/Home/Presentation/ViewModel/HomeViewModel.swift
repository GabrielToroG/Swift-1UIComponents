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

    // MARK: - Lifecycle
    func onViewDidLoad() async {
        await loadHomeOptions()
    }
    func loadHomeOptions() async {
        do {
            self.isLoading.send(true)
            let data = try await getHomeOptionsUseCases.execute(())
                self.homeOptionsSubject.send(data)
                self.isLoading.send(false)
            
        } catch {
            // Manejar errores
        }
    }
    
    func test() {
        self.isLoading.send(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.isLoading.send(false)
        }
    }
    
//    func onViewDidLoad() {
//        self.isLoading.send(true)
//        getMyListUseCase.execute(userId) { [weak self] result in
//            guard let self = self else { return }
//            self.isLoadingSubject.onNext(false)
//            if case .success(let data) = result {
//                self.myListSubject.onNext(data)
//                if self.showDeleteTopToast {
//                    self.showDeleteSuccess()
//                    self.showDeleteTopToast = false
//                }
//            } else {
//                self.showErrorSubject.onNext(())
//            }
//        }
//    }
}
