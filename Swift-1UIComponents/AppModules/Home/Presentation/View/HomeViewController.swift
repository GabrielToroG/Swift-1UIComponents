//
//  HomeViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit
import Combine

class HomeViewController: BaseViewController<HomeViewModel> {
    private enum Constants {
        enum Base {
            enum General {
                static let text: String = "home.title".localized()
                static let color: UIColor = .brandColor
            }
        }
        enum TableView {
            enum Main {
                static let color: UIColor = .clear
            }
        }
    }

    // MARK: - Properties
    var homeOptionData: UiHomeOptions?

    // MARK: - Outlets
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = Constants.TableView.Main.color
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await viewModel.onViewDidLoad()
        }
//        viewModel.test()
        configBindings()
        configUI()
    }

    // MARK: - UI Functions
    private func configUI() {
        configBasic(Constants.Base.General.text, Constants.Base.General.color)
        configTableView()
        configConstraints()
    }
    
    private func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCellClass(for: HomeTableViewCell.self)
    }

    private func configConstraints() {
        view.addSubview(tableView)
        let tableViewConstraints = [
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
    }
}

extension HomeViewController {
    private func configBindings() {
//        suscribeToLoading()
        viewModel.homeOptionsSubject.sink { _ in } receiveValue: { value in
            DispatchQueue.main.async {
                self.homeOptionData = value
                self.tableView.reloadData()
            }
        }.store(in: &anyCancellable)
    }
}

// MARK: - UITableView Extension
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeOptionData?.options.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: HomeTableViewCell.self, for: indexPath)
        cell.item = homeOptionData?.options[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            coordinator.pushViewController(newViewControllerType: LabelsViewController.self)
        case 1:
            coordinator.pushViewController(newViewControllerType: ButtonsViewController.self)
        case 2:
            coordinator.pushViewController(newViewControllerType: TextFieldsViewController.self)
        case 3:
            coordinator.pushViewController(newViewControllerType: SwitchViewController.self)
        case 4:
            coordinator.pushViewController(newViewControllerType: ImagesViewController.self)
        case 5:
            coordinator.pushViewController(newViewControllerType: ToastViewController.self)
        case 6:
            coordinator.pushViewController(newViewControllerType: ViewsViewController.self)
        case 7:
            coordinator.pushViewController(newViewControllerType: PlainTableViewViewController.self)
        default:
            print("")
        }
    }
}
