//
//  HomeViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 18-02-24.
//

import UIKit
import UserNotifications

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

        viewModel.$homeOptions.sink { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.row {
        case 0:
            viewModel.goToLabelView()
        case 1:
            viewModel.goToImagesView()
        case 2:
            viewModel.goToViewsView()
        case 3:
            viewModel.goToProgressBarsView()
        case 4:
            viewModel.goToButtonsView()
        case 5:
            viewModel.goToTextFieldsView()
        case 6:
            viewModel.goToTablesMenuView()
        default:
            return
        }
    }
}
