//
//  GetHomeOptionsUseCases.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-06-23.
//

import Foundation

final class GetHomeOptionsUseCases: BaseUseCase {
    typealias RequestType = Void
    typealias ResultType = UiHomeOptions

    let repository: HomeDataSource
    let mapper: HomeDomainMapper
    
    init(repository: HomeDataSource, mapper: HomeDomainMapper) {
        self.repository = repository
        self.mapper = mapper
    }
    
    func execute(_ parameters: Void, _ onCompletion: @escaping (Result<UiHomeOptions, Error>) -> Void) {
        repository.getHomeOptions { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let uiHomeOptions):
                let mappedOptions = self.mapper.domainToPresentation(uiHomeOptions)
                let result: Result<UiHomeOptions, Error> = .success(mappedOptions)
                onCompletion(result)
            case .failure(let error):
                // Manejar el error de alguna forma
                print("Error: \(error)")
            }
        }
    }

}
