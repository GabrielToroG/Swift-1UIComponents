//
//  EditableCellsViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 09-05-24.
//

import UIKit

final class EditableCellsViewController: BaseViewController<EditableCellsViewModel, TablesViewCoordinator> {

    // Outlets
    private lazy var containerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var viewWithReactionView: ViewWithReactionView = {
        let view = ViewWithReactionView()
        view.config(
            didTapEditButton: { [weak self] in
                self?.viewModel.toggleIsActive()
            },
            didTapDeleteButton: { [weak self] in
                self?.deleteSelectedCells()
            }, 
            didTapMarkAllButton: { [weak self] in
                self?.markAllCells()
            }
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .yellowColor
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
}

// MARK: - Lifecycle
extension EditableCellsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configBindings()
        viewModel.onViewDidLoad()
    }
}

// MARK: - Bindings
extension EditableCellsViewController {
    private func configBindings() {
        viewModel.$refreshData.sink { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }.store(in: &anyCancellable)

        viewModel.$isActive.sink { [weak self] isActive in
            guard let self = self else { return }
            self.viewWithReactionView.editMode(editing: isActive)
            self.mainTableView.setEditing(isActive, animated: true)
        }.store(in: &anyCancellable)

        viewModel.$deletedDone.sink { [weak self] indexPaths in
            guard let self = self else { return }
            self.mainTableView.deleteRows(at: indexPaths, with: .fade)
        }.store(in: &anyCancellable)
    }
}

// MARK: - UI Functions
extension EditableCellsViewController {
    private func configUI() {
        configBasic(L10n.Tableview.editableCells, .white)
        configTableView()
        configConstraints()
    }
    
    private func configTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.allowsMultipleSelection = true
        mainTableView.allowsMultipleSelectionDuringEditing = true
        mainTableView.registerCellClass(EditableTableViewCell.self)
    }

    private func configConstraints() {
        view.addSubview(containerStackView)
        containerStackView.addArrangedSubview(viewWithReactionView)
        containerStackView.addArrangedSubview(mainTableView)

        let containerStackViewConstraints = [
            containerStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerStackView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]

        NSLayoutConstraint.activate(containerStackViewConstraints)
    }
}

// MARK: - TableView Interactions
extension EditableCellsViewController {
    private func deleteSelectedCells() {
        let indexPathsToDelete = mainTableView.getSelectedRowsForDeletion()
        viewModel.removeCells(at: indexPathsToDelete)
    }

    private func markAllCells() {
        if let selected = mainTableView.indexPathsForSelectedRows, selected.count > .zero {
            self.mainTableView.deselectAllRows()
        } else {
            self.mainTableView.selectAllRows()
        }
    }
}

// MARK: - UITableViewDataSource
extension EditableCellsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            forType: EditableTableViewCell.self,
            at: indexPath
        ) else {
            return UITableViewCell()
        }
        cell.config(item: viewModel.cellData[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}
