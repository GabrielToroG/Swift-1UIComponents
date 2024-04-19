//
//  ScrollableHeadersViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-04-24.
//

import UIKit

final class ScrollableHeadersViewController: BaseViewController<ScrollableHeadersViewModel, TablesViewCoordinator> {
    private enum Constants {
        enum Base {
            enum General {
                static let title: String = "Sticky Sections"
                static let color: UIColor = .brandColor
            }
        }
        enum TableView {
            enum Main {
                static let layoutMargin: NSDirectionalEdgeInsets = .init(
                    top: .zero, leading: 16.0, bottom: .zero, trailing: 16.0)
            }
        }
    }

    private enum TableSections: Int, CaseIterable {
        case firstSection = 0
        case secondSection
    }

    // Outlets
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.sectionHeaderTopPadding = 0 // Remove top padding from plain table view
        tableView.directionalLayoutMargins = Constants.TableView.Main.layoutMargin // Margenes laterales
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // Properties
    private let sicktyData: [UIScrollableHeader] = [
        UIScrollableHeader(title: "Primera casilla"),
        UIScrollableHeader(title: "Segunda casilla"),
        UIScrollableHeader(title: "Tercera casilla"),
        UIScrollableHeader(title: "Casilla casilla"),
    ]
}

// MARK: - Lifecycle
extension ScrollableHeadersViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
}

// MARK: - UI Functions
extension ScrollableHeadersViewController {
    private func configUI() {
        configBasic(Constants.Base.General.title, Constants.Base.General.color)
        configTableView()
        configConstraints()
    }

    private func configTableView() {
        mainTableView.registerCellClass(for: ScrollableHeaderTableViewCell.self)
        mainTableView.registerHeaderClass(ScrollableTableViewHeader.self)
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }

    private func configConstraints() {
        view.addSubview(mainTableView)
        let mainTableViewConstraints = [
            mainTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ]
        NSLayoutConstraint.activate(mainTableViewConstraints)
    }
}

// MARK: - TableView Datasource
extension ScrollableHeadersViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tableSection = TableSections(rawValue: section) else {
            return 0
        }
        switch tableSection {
        case .firstSection:
            return sicktyData.count
        case .secondSection:
            return sicktyData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableSection = TableSections(rawValue: indexPath.section) else {
            return .init()
        }
        switch tableSection {
        case .firstSection:
            
            let cell = tableView.dequeueReusableCell(with: ScrollableHeaderTableViewCell.self, for: indexPath)
            cell.item = sicktyData[indexPath.row]
            cell.selectionStyle = .none
            return cell
        case .secondSection:
            let cell = tableView.dequeueReusableCell(with: ScrollableHeaderTableViewCell.self, for: indexPath)
            cell.item = sicktyData[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - TableView Datasource
extension ScrollableHeadersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let tableSection = TableSections(rawValue: section) else {
            return .init()
        }
        switch tableSection {
        case .firstSection:
            let headerView = tableView.reusableHeaderFooter() as ScrollableTableViewHeader
            headerView.configure(
                title: "Sección 1",
                showRightButton: true,
                rightButtonTitle: "Botón",
                onRightAction: {
                    print("Botón presionado")
                }
            )
            return headerView
        case .secondSection:
            let headerView = tableView.reusableHeaderFooter() as ScrollableTableViewHeader
            headerView.configure(
                title: "Sección 2"
            )
            return headerView
        }
    }

    /// Usamos esta función para agregar un margen inferior a cada sección, el tamaño del View (footer) se adapta al tamaño del View (header)
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
}
