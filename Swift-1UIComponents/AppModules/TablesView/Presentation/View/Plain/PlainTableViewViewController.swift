//
//  TablesViewViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-06-23.
//

import UIKit

// MARK: - Class
class PlainTableViewViewController: BaseViewController<PlainTableViewViewModel> {
    private enum Constants {
        enum Base {
            enum General {
                static let color: UIColor = .grayColor
                static let title: String = "Plain Table"
                static let rightTitle: String = "Grouped"
            }
        }
        enum TableView {
            enum Plain {
                static let color: UIColor = .grayColor
                static let numberOfSections: Int = 2
                static let titleForHeaderInSection: String = "Título"
                static let heightForHeaderInSection: CGFloat = 30.0
            }
        }
    }

    // Properties
    private let dataSource: [UiPlainTableOption] = [
        UiPlainTableOption(title: "Cell"),
        UiPlainTableOption(title: "Cell"),
        UiPlainTableOption(title: "Cell"),
        UiPlainTableOption(title: "Cell")
    ]
    private var plainTableViewHeaderView = PlainTableViewHeaderView()

    // Outlets
    /// En un TableView Plain:
    /// 1) No funciona el directionalLayoutMargins
    /// 2) No funciona eliminar el margen inferior de las secciones
    private lazy var plainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
//        tableView.isUserInteractionEnabled = false
        tableView.backgroundColor = Constants.TableView.Plain.color
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
}

// MARK: - UI Functions
private extension PlainTableViewViewController {
    private func configUI() {
        configBasic(Constants.Base.General.title, Constants.Base.General.color)
        configNavigation()
        configTableView()
        configDelegates()
        configConstraints()
    }

    private func configNavigation() {
        let rightBarButton = UIBarButtonItem(
            title: Constants.Base.General.rightTitle,
            style: .plain,
            target: self,
            action: #selector(didTapRightBarButton))
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.montserratRegular16,
            .foregroundColor: UIColor.blackColor
        ]
        rightBarButton.setTitleTextAttributes(attributes, for: .normal)
        navigationItem.rightBarButtonItem = rightBarButton
    }

    private func configTableView() {
        plainTableViewHeaderView.count = dataSource.count
        plainTableView.setAndLayoutTableHeaderView(header: plainTableViewHeaderView)
        plainTableView.registerCellClass(for: PlainTableViewItemCell.self)
        plainTableView.registerCellClass(for: PlainTableViewNotItemCell.self)
    }

    private func configDelegates() {
        plainTableView.delegate = self
        plainTableView.dataSource = self
    }

    private func configConstraints() {
        view.addSubview(plainTableView)
        let plainTableViewConstraints = [
            plainTableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            plainTableView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            plainTableView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            plainTableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(plainTableViewConstraints)
    }
}

// MARK: - Actions
private extension PlainTableViewViewController {
    /// Call the coordinator to move to the next ViewController (GroupedTableViewViewController)
    @objc func didTapRightBarButton() {
        coordinator.pushViewController(newViewControllerType: GroupedTableViewViewController.self)
    }
}

// MARK: - TableView Delegate
extension PlainTableViewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        Constants.TableView.Plain.numberOfSections
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Constants.TableView.Plain.titleForHeaderInSection
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.TableView.Plain.heightForHeaderInSection
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(with: PlainTableViewItemCell.self, for: indexPath)
            cell.item = dataSource[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(with: PlainTableViewNotItemCell.self, for: indexPath)
            cell.item = dataSource[indexPath.row]
            return cell
        }
    }
}
