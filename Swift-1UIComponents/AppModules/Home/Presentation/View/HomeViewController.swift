//
//  HomeViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 18-02-24.
//

import UIKit

final class HomeViewController: BaseViewController<HomeViewModel, HomeCoordinator> {

    // Outlets
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

// MARK: - Lifecycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
        viewModel.onViewDidLoad()
    }
}

// MARK: - Bindings
extension HomeViewController {
    func configBindings() {
        viewModel.$goTo.sink { [weak self] scene in
            guard let self = self, let scene = scene else { return }
            self.coordinator.goToScene(scene: scene, from: self)
        }.store(in: &anyCancellable)

        viewModel.$loadIsDone.sink { [weak self] value in
            guard let self = self else { return }
            if value {
                DispatchQueue.main.async {
                    self.mainTableView.reloadData()
                }
            }
        }.store(in: &anyCancellable)
    }
}

// MARK: - UI Functions
extension HomeViewController {
    private func configUI() {
        configBasic(L10n.Home.title, Asset.Colors.brandColor.color)
        configNavigation()
        configTableView()
        configConstraints()
    }

    private func configNavigation() {
        let backButton = UIBarButtonItem()
        backButton.title = L10n.General.back
        navigationItem.backBarButtonItem = backButton
    }

    private func configTableView() {
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.registerCellClass(HomeTableViewCell.self)
    }

    private func configConstraints() {
        view.addSubview(mainTableView)
        let mainTableViewConstraints = [
            mainTableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainTableView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainTableView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainTableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(mainTableViewConstraints)
    }
}

// MARK: - UITableView Extension
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.homeOptions?.count ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            forType: HomeTableViewCell.self,
            at: indexPath
        ) else {
            return UITableViewCell()
        }
        cell.item = viewModel.homeOptions?[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Dimensions.TableView.Cell.tinyHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let position = viewModel.homeOptions?[indexPath.row],
              let row = HomeTableViewRows(rawValue: position.row) else {
            return
        }

        tableView.deselectRow(at: indexPath, animated: false)

        switch row {
        case .label:
            viewModel.goToLabelView()
        case .images:
            viewModel.goToImagesView()
        case .buttons:
            viewModel.goToButtonsView()
        case .textFields:
            viewModel.goToTextFieldsView()
        case .switchs:
            viewModel.goToSwitchView()
        case .progressBars:
            viewModel.goToProgressBarsView()
        case .graphics:
            viewModel.goToGraphicsView()
        case .tablesMenu:
            viewModel.goToTablesMenuView()
        case .collectionsMenu:
            viewModel.goToCollectionMenuView()
        case .webViews:
            viewModel.goToWebViews()
        case .views:
            viewModel.goToViewsView()
        case .toast:
            viewModel.goToToastView()
        case .serverDriven:
            viewModel.goToServerDrivenView()
        }
    }
}
