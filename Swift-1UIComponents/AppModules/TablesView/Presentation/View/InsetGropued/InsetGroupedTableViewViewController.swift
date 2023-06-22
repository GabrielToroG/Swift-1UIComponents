//
//  InsetGroupedTableViewViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 21-06-23.
//

import UIKit

class InsetGroupedTableViewViewController: BaseViewController<InsetGroupedTableViewViewModel> {
    private enum Constants {
        enum Base {
            enum General {
                static let color: UIColor = .white
                static let title: String = "InsetGrouped Table"
            }
        }
        enum TableView {
            enum InsetGrouped {
                static let color: UIColor = .grayColor
                static let numberOfSections: Int = 2
                static let titleForHeaderInSection: String = "Título"
                static let heightForHeaderInSection: CGFloat = 30.0
                static let heightForFooterInSection: CGFloat = .leastNonzeroMagnitude
                static let layoutMargin: NSDirectionalEdgeInsets = .init(
                    top: .zero, leading: 16.0, bottom: .zero, trailing: 16.0)
            }
        }
    }

    // MARK: - Properties
    private let data = ["Cell", "Cell", "Cell", "Cell"]
    private var insetGroupTableViewHeaderView = InsetGroupTableViewHeaderView()

    // MARK: - Outlets
    /// En un TableView InsetGrouped:
    /// 1) Si funciona el directionalLayoutMargins
    /// 2) Si funciona eliminar el margen inferior de las secciones
    private lazy var insetGroupedTableView: UITableView = {
        let view = UIView()
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = Constants.TableView.InsetGrouped.color
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // Para eliminar footer de las secciones
        view.frame.size.height = .leastNonzeroMagnitude
        tableView.tableFooterView = view
        tableView.estimatedSectionFooterHeight = .zero
        // Para controlar los margenes laterales
        tableView.directionalLayoutMargins = Constants.TableView.InsetGrouped.layoutMargin
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
        configTableView()
        configDelegates()
        configConstraints()
    }

    private func configTableView() {
        insetGroupedTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        insetGroupTableViewHeaderView.count = data.count
        insetGroupedTableView.setAndLayoutTableHeaderView(header: insetGroupTableViewHeaderView)
    }

    private func configDelegates() {
        insetGroupedTableView.delegate = self
        insetGroupedTableView.dataSource = self
    }

    private func configConstraints() {
        view.addSubview(insetGroupedTableView)
        let insetGroupedTableViewConstraints = [
            insetGroupedTableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            insetGroupedTableView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            insetGroupedTableView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            insetGroupedTableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(insetGroupedTableViewConstraints)
    }
}

// MARK: - TableView Delegate
extension InsetGroupedTableViewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        Constants.TableView.InsetGrouped.numberOfSections
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Constants.TableView.InsetGrouped.titleForHeaderInSection
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.TableView.InsetGrouped.heightForHeaderInSection
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        Constants.TableView.InsetGrouped.heightForFooterInSection // Elimina margen inferior sección
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row]) \(indexPath)"
        return cell
    }
}
