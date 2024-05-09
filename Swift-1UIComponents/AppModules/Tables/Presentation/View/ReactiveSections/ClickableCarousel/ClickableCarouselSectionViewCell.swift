//
//  ClickableCarouselSectionViewCell.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 09-05-24.
//

import UIKit

final class ClickableCarouselSectionViewCell: UITableViewCell, Reusable {

    // Outlet
    private lazy var mainCollectionView: UICollectionView = {
        let spacing: CGFloat = Dimensions.CollectionView.normalSpacing
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // Properties
    private var data: [UIClickableCarouselSectionArgs] = []

    // Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }
}

// MARK: - Config
extension ClickableCarouselSectionViewCell {
    func config(_ data: [UIClickableCarouselSectionArgs]) {
        self.data = data
        self.mainCollectionView.reloadData()
    }
}

// MARK: - Config UI
extension ClickableCarouselSectionViewCell {
    func configUI() {
        contentView.backgroundColor = Asset.Colors.brandColor.color
        configCollectionView()
        configConstraints()
    }

    func configCollectionView() {
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        mainCollectionView.registerCellClass(ReusableCollectionViewCell.self)
    }

    func configConstraints() {
        contentView.addSubview(mainCollectionView)
        let mainCollectionViewConstraints = [
            mainCollectionView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Dimensions.Margin.small),
            mainCollectionView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            mainCollectionView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            mainCollectionView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -Dimensions.Margin.small),
            mainCollectionView.heightAnchor.constraint(
                equalToConstant: Dimensions.CollectionView.normalHeight)
        ]
        NSLayoutConstraint.activate(mainCollectionViewConstraints)
    }
}

// MARK: - UICollectionViewDelegate
extension ClickableCarouselSectionViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
}

// MARK: - UICollectionViewDataSource
extension ClickableCarouselSectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            forType: ReusableCollectionViewCell.self,
            at: indexPath
        ) else {
            return UICollectionViewCell()
        }
        let view = ClickableCarouselCellView(frame: .zero)
        view.config(data: data[indexPath.row])
        cell.set(subview: view)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ClickableCarouselSectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(
            width: Dimensions.CollectionView.Cell.normalWidth,
            height: Dimensions.CollectionView.Cell.normalHeight)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        if section == .zero {
            return UIEdgeInsets(top: .zero, left: 16, bottom: .zero, right: .zero)
        } else {
            return UIEdgeInsets.zero
        }
    }
}
