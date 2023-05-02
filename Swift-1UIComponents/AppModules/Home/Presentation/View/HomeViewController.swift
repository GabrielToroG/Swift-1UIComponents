//
//  HomeViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModel> {
    
    // MARK: - Properties
    let dataSource: [UiHomeOption] = [
        UiHomeOption(icon: "home.label.option", title: "home_label_option".localized()),
        UiHomeOption(icon: "home.image.option", title: "home_image_option".localized())
    ]
    
    // MARK: - Outlets
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
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
    }
}
