//
//  BaseViewController.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit
import Combine

open class BaseViewController<V: BaseViewModel>: UIViewController {
    
    public let viewModel: V
    public let coordinator: Coordinator
    public let notificationCenter: NotificationCenterWrapper
    public var anyCancellable: [AnyCancellable] = []
    
    private lazy var loadingView: LoaderView = {
        let loaderView = LoaderView()
        loaderView.startProgressAnimation()
        loaderView.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        return loaderView
    }()
    private lazy var toastView: ToastView = {
        let toastView = ToastView()
        toastView.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        toastView.translatesAutoresizingMaskIntoConstraints = false
        return toastView
    }()

    public init(
        _ viewModel: V,
        coordinator: Coordinator,
        notificationCenter: NotificationCenterWrapper
    ) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        self.notificationCenter = notificationCenter
        super.init(nibName: nil, bundle: nil)
        coordinator.viewController = self
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.endEditing(true)
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
    // MARK: - Loader
    private func showLoading(_ value: Bool) {
        if value {
            addLoadConstraint()
        } else {
            removeLoadConstraint()
        }
    }

    private func addLoadConstraint() {
        view.addSubview(loadingView)

        let loadConstraints = [
            loadingView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ]

        NSLayoutConstraint.activate(loadConstraints)
    }

    private func removeLoadConstraint() {
        let loadConstraints = [
            loadingView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ]

        NSLayoutConstraint.deactivate(loadConstraints)

        loadingView.removeFromSuperview()
    }
    
    public func suscribeToLoading() {
        viewModel.isLoading.sink { _ in } receiveValue: { [weak self] value in
            guard let self = self else { return }
            self.showLoading(value)
        }.store(in: &anyCancellable)
    }

    // MARK: - Toast
    private func showToast(_ value: Bool) {
        if value {
            addToastConstraints()
        } else {
            removeToastConstraints()
        }
    }
    
    private func addToastConstraints() {
        view.addSubview(toastView)

        let toastViewConstraints = [
            toastView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            toastView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            toastView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ]

        NSLayoutConstraint.activate(toastViewConstraints)
    }
    
    private func removeToastConstraints() {
        let toastViewConstraints = [
            toastView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            toastView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            toastView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ]

        NSLayoutConstraint.deactivate(toastViewConstraints)

        toastView.removeFromSuperview()
    }

    public func suscribeToToast() {
        viewModel.isTopToast.sink { _ in } receiveValue: { [weak self] value in
            guard let self = self else { return }
            self.showToast(value)
        }.store(in: &anyCancellable)
    }
}
