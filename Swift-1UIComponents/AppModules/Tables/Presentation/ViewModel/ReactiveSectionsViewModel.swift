//
//  ReactiveSectionsViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-04-24.
//

import UIKit

struct UIClickableCarouselSectionArgs {
    let id: Int
    let title: String
    let onSelectedOption: (() -> Void)?
    var stateSelected: Bool?
}

struct UIReactiveInformationArgs {
    let id: Int
    let backgroundColor: UIColor
}

final class ReactiveSectionsViewModel: BaseViewModel {

    enum Sections: String {
        case clickableCarousel = "clickable_carousel"
        case reactiveInformation = "reactive_information"
    }

    @Published private(set) var refreshData: Bool?

    private(set) var sectionsView: [UISection]?
    private(set) var isClickableDataLoaded: Bool = true
    private(set) var clickableData: [UIClickableCarouselSectionArgs] = []
    private(set) var reactiveData: [UIReactiveInformationArgs] = []
    private(set) var informationIdSelected: Int = -1
    
    private(set) var isFirstTime = true
    private(set) var sectionsViewSAVE: [UISection]?
}

extension ReactiveSectionsViewModel {
    func onViewDidLoad() {
        buildInformation()
    }

    func buildInformation() {
        buildReactiveData()
        buildUISections()
    }

    func buildClickableData() -> [UIClickableCarouselSectionArgs]{
        return [
            UIClickableCarouselSectionArgs(
                id: 1,
                title: "Celda 1",
                onSelectedOption: { [weak self] in
                    guard let self = self else { return }
                    self.changeCardStateSelected(id: 1)
                },
                stateSelected: false
            ),
            UIClickableCarouselSectionArgs(
                id: 4,
                title: "Celda 4",
                onSelectedOption: { [weak self] in
                    guard let self = self else { return }
                    self.changeCardStateSelected(id: 4)
                },
                stateSelected: false
            ),
            UIClickableCarouselSectionArgs(
                id: 7,
                title: "Celda 7",
                onSelectedOption: { [weak self] in
                    guard let self = self else { return }
                    self.changeCardStateSelected(id: 7)
                },
                stateSelected: false
            ),
            UIClickableCarouselSectionArgs(
                id: 8,
                title: "Celda 8",
                onSelectedOption: { [weak self] in
                    guard let self = self else { return }
                    self.changeCardStateSelected(id: 8)
                },
                stateSelected: false
            )
        ]
    }

    func buildReactiveData() {
        reactiveData = [
            UIReactiveInformationArgs(
                id: 1,
                backgroundColor: .systemRed
            ),
            UIReactiveInformationArgs(
                id: 2,
                backgroundColor: .systemBlue
            ),
            UIReactiveInformationArgs(
                id: 3,
                backgroundColor: .systemYellow
            ),
            UIReactiveInformationArgs(
                id: 4,
                backgroundColor: .systemGreen
            ),
        ]
    }

    func buildUISections() {
        var sections = [UISection]()
        
        sections.append(setNewUISection(with: Sections.clickableCarousel))
        if isClickableDataLoaded {
            clickableData = buildClickableData()
            isClickableDataLoaded = false
        }
        sections.append(setNewUISection(with: Sections.reactiveInformation))
        sectionsView = sections
        refreshData = true
    }
}

extension ReactiveSectionsViewModel {
    func setNewUISection(with section: Sections) -> UISection {
        return UISection(
            sectionId: section.rawValue,
            name: section.rawValue
        )
    }
}

extension ReactiveSectionsViewModel {
    func changeCardStateSelected(id: Int) {
        // Si se selecciona la celda activa, se desactiva
        if informationIdSelected == id {
            clickableData = clickableData.map { product in
                var newProduct = product
                if newProduct.id == id {
                    informationIdSelected = -1
                    newProduct.stateSelected = false
                }
                return newProduct
            }
        // Se activa la celda seleccionada
        } else {
            clickableData = clickableData.map { product in
                var newProduct = product
                if newProduct.id == id {
                    informationIdSelected = id
                    newProduct.stateSelected = true
                } else {
                    newProduct.stateSelected = false
                }
                return newProduct
            }
        }

        if let section = sectionsView {
            buildUISections()
        }
    }
}
