//
//  ReactiveSectionsViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-04-24.
//

import UIKit

final class ReactiveSectionsViewController: BaseViewController<ReactiveSectionsViewModel, TablesViewCoordinator> {

    // Outlets
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.isUserInteractionEnabled = true
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.isScrollEnabled = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
}

// MARK: - Lifecycle
extension ReactiveSectionsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
        viewModel.onViewDidLoad()
    }
}

// MARK: - Bindings
extension ReactiveSectionsViewController {
    private func configBindings() {
        viewModel.$refreshData.sink { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }.store(in: &anyCancellable)
    }
}

// MARK: - UI Functions
extension ReactiveSectionsViewController {
    private func configUI() {
        configBasic(L10n.Tableview.reactiveSections, Asset.Colors.brandColor.color)
        setupTableView()
        configConstraints()
    }

    private func setupTableView() {
        mainTableView.registerCellClass(ReusableTableViewCell.self)
        mainTableView.registerCellClass(ClickableCarouselSectionViewCell.self)
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    private func configConstraints() {
        view.addSubview(mainTableView)
        let mainTableViewConstraints = [
            mainTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(mainTableViewConstraints)
    }
}

extension ReactiveSectionsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = viewModel.sectionsView?.count else { return .zero }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = viewModel.sectionsView?[indexPath.row],
              let type = ReactiveSectionsViewModel.Sections(rawValue: section.sectionId) else {
            return UITableViewCell()
        }
        
        switch type {
        case .clickableCarousel:
            return buildClickableCarousel(tableView: tableView, indexPath: indexPath)
        case .reactiveInformation:
            return buildReactiveContainer(tableView: tableView, indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = viewModel.sectionsView?[indexPath.row],
              let type = ReactiveSectionsViewModel.Sections(rawValue: section.sectionId) else {
            return .zero
        }

        switch type {
        case .clickableCarousel:
            return tableView.estimatedRowHeight
        case .reactiveInformation:
            return tableView.estimatedRowHeight
        }
    }

    private func buildClickableCarousel(
        tableView: UITableView,
        indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            forType: ClickableCarouselSectionViewCell.self,
            at: indexPath
        ) else {
            return UITableViewCell()
        }
        cell.config(viewModel.clickableData)
        return cell
    }

    private func buildReactiveContainer(
        tableView: UITableView,
        indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            forType: ReusableTableViewCell.self,
            at: indexPath
        ) else {
            return UITableViewCell()
        }
        let view = ReactiveInfoSectionView(frame: .zero)
        view.config(
            viewModel.reactiveData,
            viewModel.clickableIdSelected
        )
        cell.set(subview: view)
        return cell
    }
}
