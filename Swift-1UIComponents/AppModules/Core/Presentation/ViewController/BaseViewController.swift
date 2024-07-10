//
//  BaseViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import UIKit
import Combine

class BaseViewController<V: BaseViewModel, C: Coordinator>: UIViewController {

    // Outlets
    private lazy var loadingView: LoaderView = {
        let loaderView = LoaderView()
        loaderView.startProgressAnimation()
        loaderView.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        return loaderView
    }()

    // Properties
    let viewModel: V
    let coordinator: C
    let notificationCenter: NotificationCenterWrapper
    var anyCancellable: [AnyCancellable] = []
    private var bannerLoadingConstraints: [NSLayoutConstraint] = []

    // Init
    init(
        _ viewModel: V,
        _ coordinator: C,
        _ notificationCenter: NotificationCenterWrapper
    ) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        self.notificationCenter = notificationCenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Override
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Current ViewController: \(type(of: self))")
        suscribeToLoading()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.endEditing(true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }

    deinit {
        anyCancellable.forEach { $0.cancel() }
    }
}

// MARK: - Loader
extension BaseViewController {
    private func showLoading(_ value: Bool) {
        if value {
            self.addLoadConstraint()
        } else {
            self.removeLoadConstraint()
        }
    }

    private func addLoadConstraint() {
        view.addSubview(loadingView)
        bannerLoadingConstraints = [
            loadingView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ]
        NSLayoutConstraint.activate(bannerLoadingConstraints)
    }

    private func removeLoadConstraint() {
        NSLayoutConstraint.deactivate(bannerLoadingConstraints)
        bannerLoadingConstraints.removeAll()
        self.loadingView.removeFromSuperview()
    }

    func suscribeToLoading() {
        viewModel.isLoadingPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self = self else { return }
                self.showLoading(value)
            }
            .store(in: &anyCancellable)
    }
}
