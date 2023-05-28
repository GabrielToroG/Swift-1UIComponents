//
//  HomeViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit

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
    let dataSource: [UiHomeOption] = [
        UiHomeOption(icon: "home.label.option", title: "home.label.option".localized()),
        UiHomeOption(icon: "home.button.option", title: "home.button.option".localized()),
        UiHomeOption(icon: "home.textfield.option", title: "home.textfield.option".localized()),
        UiHomeOption(icon: "home.image.option", title: "home.image.option".localized()),
        UiHomeOption(icon: "home.view.option", title: "home.view.option".localized()),
        UiHomeOption(icon: "home.table.option", title: "home.table.option".localized()),
        UiHomeOption(icon: "home.collection.option", title: "home.collection.option".localized()),
        UiHomeOption(icon: "home.web.option", title: "home.web.option".localized()),
        UiHomeOption(icon: "home.switch.option", title: "home.switch.option".localized()),
        UiHomeOption(icon: "home.toast.option", title: "home.toast.option".localized()),
    ]

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
        configUI()
    }

    // MARK: - UI Functions
    private func configUI() {
        configBasic(Constants.Base.General.text, Constants.Base.General.color)
        configTableView()
        configConstraints()
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

    private func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCellClass(for: HomeTableViewCell.self)
    }
}

// MARK: - UITableView Extension
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: HomeTableViewCell.self, for: indexPath)
        cell.item = dataSource[indexPath.row]
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
            coordinator.pushViewController(newViewControllerType: ImagesViewController.self)
        default:
            print("")
        }
    }
}
