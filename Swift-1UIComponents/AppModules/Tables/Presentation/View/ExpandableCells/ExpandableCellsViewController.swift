//
//  ExpandableCellsViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 12-05-24.
//

import UIKit

final class ExpandableCellsViewController: BaseViewController<ExpandableCellsViewModel, TablesViewCoordinator> {
    private enum Constants {
        static let maxHeightCell: CGFloat = 120
        static let minheightCell: CGFloat = 80
    }

    // Outlets
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isUserInteractionEnabled = true
        return tableView
    }()
}

// MARK: - Lifecycle
extension ExpandableCellsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
    }
}

// MARK: - Bindings
extension ExpandableCellsViewController {
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
extension ExpandableCellsViewController {
    private func configUI() {
        configBasic(L10n.Tableview.expandableCells, Asset.Colors.brandColor.color)
        configTableView()
        configConstraints()
    }

    private func configTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.registerCellClass(ExpandableTableViewCell.self)
    }

    private func configConstraints() {
        view.addSubview(mainTableView)
        let mainTableViewConstraints = [
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(mainTableViewConstraints)
    }
}

// MARK: - UITableViewDataSource
extension ExpandableCellsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            forType: ExpandableTableViewCell.self,
            at: indexPath
        ) else {
            return UITableViewCell()
        }
        let data = viewModel.cellData[indexPath.row]
        cell.config(
            item: data,
            didTapGreenView: { [weak self] in
                self?.viewModel.updateLeftViewActiveState(at: indexPath.row)
            },
            didTapRedView: { [weak self] in
                self?.viewModel.updateRightViewActiveState(at: indexPath.row)
            }
        )
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellData = viewModel.cellData[indexPath.row]
        if cellData.leftViewActived || cellData.rightViewActived {
            return Constants.maxHeightCell
        } else {
            return Constants.minheightCell
        }
    }
}
