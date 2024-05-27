//
//  ReactiveSectionsViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-04-24.
//

import UIKit

final class ReactiveSectionsViewModel: BaseViewModel {

    enum Sections: String {
        case clickableCarousel = "clickable_carousel"
        case reactiveInformation = "reactive_information"
    }

    // Properties
    private(set) var sectionsView: [UISection]?
    private(set) var clickableDataLoaded: Bool = false
    private(set) var clickableIdSelected: Int = -Dimensions.Index.one
    private(set) var clickableData: [UIClickableCarouselSectionArgs] = []
    private(set) var reactiveData: [UIReactiveInformationArgs] = []

    // Combine
    @Published private(set) var refreshData: Bool?

    override func onViewDidLoad() {
        super.onViewDidLoad()
        buildReactiveData()
    }
}

// MARK: - Fake Data
extension ReactiveSectionsViewModel {
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

        buildUISections()
    }

    func buildClickableData() -> [UIClickableCarouselSectionArgs]{
        return [
            UIClickableCarouselSectionArgs(
                id: 1,
                title: "Celda 1",
                onSelectionAction: { [weak self] in
                    guard let self = self else { return }
                    self.updateAllCardSelectionStates(id: 1)
                },
                isSelected: false
            ),
            UIClickableCarouselSectionArgs(
                id: 4,
                title: "Celda 4",
                onSelectionAction: { [weak self] in
                    guard let self = self else { return }
                    self.updateAllCardSelectionStates(id: 4)
                },
                isSelected: false
            ),
            UIClickableCarouselSectionArgs(
                id: 7,
                title: "Celda 7",
                onSelectionAction: { [weak self] in
                    guard let self = self else { return }
                    self.updateAllCardSelectionStates(id: 7)
                },
                isSelected: false
            ),
            UIClickableCarouselSectionArgs(
                id: 8,
                title: "Celda 8",
                onSelectionAction: { [weak self] in
                    guard let self = self else { return }
                    self.updateAllCardSelectionStates(id: 8)
                },
                isSelected: false
            )
        ]
    }
}

// MARK: - UI
extension ReactiveSectionsViewModel {
    func buildUISections() {
        var sections = [UISection]()

        setClickableSection(into: &sections)
        setReactiveSection(into: &sections)

        sectionsView = sections
        refreshData = true
    }
    
    private func setClickableSection(into sections: inout [UISection]) {
        sections.append(setNewUISection(with: Sections.clickableCarousel))
        if !clickableDataLoaded {
            clickableData = buildClickableData()
            clickableDataLoaded = true
        }
    }

    private func setReactiveSection(into sections: inout [UISection]) {
        let show = reactiveData.contains { category in
            return category.id == clickableIdSelected
        }
        if show {
            sections.append(setNewUISection(with: Sections.reactiveInformation))
        }
    }
}

// MARK: - Complementary UI
extension ReactiveSectionsViewModel {
    func setNewUISection(with section: Sections) -> UISection {
        return UISection(
            sectionId: section.rawValue,
            name: section.rawValue
        )
    }
}

// MARK: - Actions
extension ReactiveSectionsViewModel {
    func updateAllCardSelectionStates(id: Int) {
        guard let index = clickableData.firstIndex(where: { $0.id == id }) else {
            return
        }

        if clickableIdSelected == id {
            clickableIdSelected = -Dimensions.Index.one
            clickableData[index].isSelected = false
        } else {
            clickableIdSelected = id
            clickableData.indices.forEach { clickableData[$0].isSelected = clickableData[$0].id == id }
        }

        buildUISections()
    }
}
