//
//  SwipeableCellsViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 11-05-24.
//

import UIKit

final class SwipeableCellsViewController: BaseViewController<SwipeableCellsViewModel, TablesViewCoordinator> {

    // Outlets
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isUserInteractionEnabled = true
        return tableView
    }()
}

// MARK: - Lifecycle
extension SwipeableCellsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        viewModel.onViewDidLoad()
    }
}

// MARK: - UI Functions
extension SwipeableCellsViewController {
    private func configUI() {
        configBasic(L10n.Tableview.swipeAction, Asset.Colors.brandColor.color)
        configTableView()
        configConstraints()
    }

    private func configTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    private func configConstraints() {
        view.addSubview(mainTableView)
        let mainTableViewConstraints = [
            mainTableView.topAnchor.constraint(
                equalTo: view.topAnchor),
            mainTableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
            mainTableView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(mainTableViewConstraints)
    }
    
}

// MARK: - UITableViewDataSource
extension SwipeableCellsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.cellData[indexPath.row].name
        return cell
    }
  
    func tableView(
        _ tableView: UITableView,
        editingStyleForRowAt indexPath: IndexPath
    ) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            viewModel.removeCells(at: indexPath.row)
            tableView.endUpdates()
        }
    }
}
