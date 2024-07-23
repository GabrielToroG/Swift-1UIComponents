//
//  HomeViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 18-02-24.
//

import Foundation

final class HomeViewModel: BaseViewModel {

    // Constants
    private enum Constants {
        static let requestApp: String = "uikit"
    }

    // Combine
    @Published private(set) var goTo: HomeCoordinator.GoToScene?
    @Published private(set) var loadIsDone: Bool = false

    // Properties
    private(set) var homeOptions: [UiHomeOptionCorrect]?

    // Init
    private let getHomeMenuUseCase: GetHomeMenuUseCase.Alias
    private let getLocalHomeMenuUseCase: GetLocalHomeMenuUseCase.Alias
    private let saveLocalHomeMenuUseCase: SaveLocalHomeMenuUseCase.Alias
    private let mapper: HomePresentationMapper

    init(
        getHomeMenuUseCase: GetHomeMenuUseCase.Alias,
        getLocalHomeMenuUseCase: GetLocalHomeMenuUseCase.Alias,
        saveLocalHomeMenuUseCase: SaveLocalHomeMenuUseCase.Alias,
        mapper: HomePresentationMapper
    ) {
        self.getHomeMenuUseCase = getHomeMenuUseCase
        self.getLocalHomeMenuUseCase = getLocalHomeMenuUseCase
        self.saveLocalHomeMenuUseCase = saveLocalHomeMenuUseCase
        self.mapper = mapper
    }

    // Override
    override func onViewDidLoad() {
        super.onViewDidLoad()

        self.getHomeMenuInfo()

        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.loadIsDone = true
            self.isLoadingSubject.send(false)
        }
    }
}

// MARK: - Use Cases
extension HomeViewModel {
    func getHomeMenuInfo() {
        guard let data = getLocalHomeMenuInfo() else {
            isLoadingSubject.send(true)
            getRemoteHomeMenuInfo()
            return
        }
        self.homeOptions = mapper.format(data.options)
    }

    private func getLocalHomeMenuInfo() -> UiHomeMenu? {
        let result = getLocalHomeMenuUseCase.execute(nil)
        if case .success(let menu) = result {
            return menu
        } else {
            return nil
        }
    }

    private func getRemoteHomeMenuInfo() {
        dispatchGroup.enter()
        let request = UIHomeMenuRequest(app: Constants.requestApp)
        getHomeMenuUseCase.execute(request) { [weak self] result in
            guard let self = self else { return }
            defer { self.dispatchGroup.leave() }
            switch result {
            case .success(let data):
                _ = self.saveLocalHomeMenuUseCase.execute(mapper.presentationToDomain(data))
                self.homeOptions = mapper.format(data.options)
            case .error(let error):
                print(error)
            case .unauthorized(let error):
                print(error)
            }
        }
    }
}

// MARK: - Coordinator
extension HomeViewModel {
    func goToLabelView() {
        self.goTo = .labelsView
    }

    func goToImagesView() {
        self.goTo = .imagesView
    }

    func goToButtonsView() {
        self.goTo = .buttonsView
    }

    func goToTextFieldsView() {
        self.goTo = .textFieldsView
    }

    func goToSwitchView() {
        
    }

    func goToProgressBarsView() {
        self.goTo = .progressBarView
    }

    func goToGraphicsView() {
        
    }

    func goToTablesMenuView() {
        self.goTo = .tablesMenu
    }

    func goToCollectionMenuView() {
        
    }

    func goToWebViews() {
        
    }

    func goToSegmentedControlView() {
        
    }

    func goToViewsView() {
        self.goTo = .viewsView
    }

    func goToToastView() {
        
    }

    func goToServerDrivenView() {
        
    }
}
