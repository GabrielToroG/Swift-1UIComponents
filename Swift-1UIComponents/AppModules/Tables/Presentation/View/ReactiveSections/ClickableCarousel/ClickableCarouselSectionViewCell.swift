//
//  ClickableCarouselSectionViewCell.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 09-05-24.
//

import UIKit

final class ClickableCarouselSectionViewCell: UITableViewCell, Reusable {

    private lazy var mainCollectionView: UICollectionView = {
        let spacing: CGFloat = 2
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    var data: [UIClickableCarouselSectionArgs] = []


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }

    func config(_ data: [UIClickableCarouselSectionArgs]) {
        self.data = data
        self.mainCollectionView.reloadData()
    }
}

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
            mainCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainCollectionView.heightAnchor.constraint(equalToConstant: Dimensions.TableView.Sections.normalheight)
        ]
        NSLayoutConstraint.activate(mainCollectionViewConstraints)
    }
}

extension ClickableCarouselSectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
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

extension ClickableCarouselSectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(
            width: Dimensions.TableView.Sections.normalWidth,
            height: Dimensions.TableView.Sections.normalheight)
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
