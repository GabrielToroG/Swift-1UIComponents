//
//  StickyHeadersViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 01-04-24.
//

import UIKit

final class StickyHeadersViewController: BaseViewController<StickyHeadersViewModel, TablesViewCoordinator> {

    private enum TableSections: Int, CaseIterable {
        case firstSection = 0
        case secondSection
    }

    // Outlets
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.sectionHeaderTopPadding = .zero // Remove top padding from plain table view
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
}

// MARK: - Lifecycle
extension StickyHeadersViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
        viewModel.onViewDidLoad()
    }
}

// MARK: - Bindings
extension StickyHeadersViewController {
    func configBindings() {
        viewModel.$stickyData.sink { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }.store(in: &anyCancellable)
    }
}

// MARK: - UI Functions
extension StickyHeadersViewController {
    private func configUI() {
        configBasic(L10n.Tableview.stickyHeaders, Asset.Colors.whiteColor.color)
        configTableView()
        configConstraints()
    }

    private func configTableView() {
        mainTableView.registerCellClass(for: StickyHeadersTableViewCell.self)
        mainTableView.registerHeaderClass(StickyTableViewHeader.self)
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
extension StickyHeadersViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableSections.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tableSection = TableSections(rawValue: section) else {
            return .zero
        }

        switch tableSection {
        case .firstSection:
            return viewModel.stickyData.count
        case .secondSection:
            return viewModel.stickyData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableSection = TableSections(rawValue: indexPath.section) else {
            return .init()
        }

        switch tableSection {
        case .firstSection:
            
            let cell = tableView.dequeueReusableCell(with: StickyHeadersTableViewCell.self, for: indexPath)
            cell.item = viewModel.stickyData[indexPath.row]
            cell.selectionStyle = .none
            return cell
        case .secondSection:
            let cell = tableView.dequeueReusableCell(with: StickyHeadersTableViewCell.self, for: indexPath)
            cell.item = viewModel.stickyData[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Dimensions.TableView.headerViewHeight
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .zero
    }
}

// MARK: - TableView Datasource
extension StickyHeadersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let tableSection = TableSections(rawValue: section), 
              !viewModel.stickyData.isEmpty else {
            return .init()
        }

        switch tableSection {
        case .firstSection:
            let headerView = tableView.reusableHeaderFooter() as StickyTableViewHeader
            headerView.configure(
                title: L10n.Tableview.StickyHeaders.first,
                showRightButton: true,
                rightButtonTitle: L10n.Tableview.StickyHeaders.button,
                onRightAction: {
                    print("Botón presionado")
                }
            )
            return headerView
        case .secondSection:
            let headerView = tableView.reusableHeaderFooter() as StickyTableViewHeader
            headerView.configure(
                title: L10n.Tableview.StickyHeaders.second
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
