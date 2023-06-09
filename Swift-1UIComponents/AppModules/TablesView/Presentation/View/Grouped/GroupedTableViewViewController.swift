//
//  GroupedTableViewViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 20-06-23.
//

import UIKit

class GroupedTableViewViewController: BaseViewController<GroupedTableViewViewModel> {
    private enum Constants {
        enum Base {
            enum General {
                static let color: UIColor = .white
                static let title: String = "Grouped Table"
                static let rightTitle: String = "Inset Grouped"

            }
        }
        enum TableView {
            enum Grouped {
                static let color: UIColor = .grayColor
                static let numberOfSections: Int = 2
                static let titleForHeaderInSection: String = "Título"
                static let heightForHeaderInSection: CGFloat = 30.0
                static let heightForFooterInSection: CGFloat = .leastNonzeroMagnitude
                static let layoutMargin: NSDirectionalEdgeInsets = .init(
                    top: .zero, leading: 32.0, bottom: .zero, trailing: 32.0)
            }
        }
    }

    // MARK: - Properties
    private let dataSource: [UiGroupedTableOption] = [
        UiGroupedTableOption(title: "Cell"),
        UiGroupedTableOption(title: "Cell"),
        UiGroupedTableOption(title: "Cell"),
        UiGroupedTableOption(title: "Cell")
    ]
    private var groupedTableViewHeaderView = GroupedTableViewHeaderView()

    // MARK: - Outlets
    /// En un TableView Grouped:
    /// 1) No funciona el directionalLayoutMargins
    /// 2) Si funciona eliminar el margen inferior de las secciones
    private lazy var groupedTableView: UITableView = {
        let view = UIView()
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = Constants.TableView.Grouped.color
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // Para eliminar footer de las secciones
        view.frame.size.height = .leastNonzeroMagnitude
        tableView.tableFooterView = view
        tableView.estimatedSectionFooterHeight = .zero
        return tableView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - UI Functions
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
        groupedTableViewHeaderView.count = dataSource.count
        groupedTableView.setAndLayoutTableHeaderView(header: groupedTableViewHeaderView)
        groupedTableView.registerCellClass(for: GroupedTableViewItemCell.self)
        groupedTableView.registerCellClass(for: GroupedTableViewNotItemCell.self)
    }

    private func configDelegates() {
        groupedTableView.delegate = self
        groupedTableView.dataSource = self
    }

    private func configConstraints() {
        view.addSubview(groupedTableView)
        let groupedTableViewConstraints = [
            groupedTableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            groupedTableView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            groupedTableView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            groupedTableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(groupedTableViewConstraints)
    }
}

// MARK: - Actions
private extension GroupedTableViewViewController {
    /// Call the coordinator to move to the next ViewController (InsetGroupedTableViewViewController)
    @objc func didTapRightBarButton() {
        coordinator.pushViewController(newViewControllerType: InsetGroupedTableViewViewController.self)
    }
}

// MARK: - TableView Delegate
extension GroupedTableViewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        Constants.TableView.Grouped.numberOfSections
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Constants.TableView.Grouped.titleForHeaderInSection
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.TableView.Grouped.heightForHeaderInSection
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        Constants.TableView.Grouped.heightForFooterInSection // Elimina margen inferior sección
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(with: GroupedTableViewItemCell.self, for: indexPath)
            cell.item = dataSource[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(with: GroupedTableViewNotItemCell.self, for: indexPath)
            cell.item = dataSource[indexPath.row]
            return cell
        }
    }
}
