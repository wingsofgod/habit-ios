//
//  CategoryCollectionView.swift
//  habit
//
//  Created by Canberk Bibican on 19.04.2022.
//

import UIKit

protocol CategoryCollectionViewProtocol {
    var viewController: HomePageViewController? { get set }
    func update(newItemList: [CategoryResponseModel])
}

protocol CategoryCollectionViewOutPut: AnyObject {
    func onSelected(item: CategoryResponseModel)
}

final class CategoryCollectionView: NSObject {

    private lazy var itemList: [CategoryResponseModel] = []
    weak var viewController: HomePageViewController?
    weak var delegate: CategoryCollectionViewOutPut?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(categoryModel: itemList[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.onSelected(item: itemList[indexPath.row])
    }
}

extension CategoryCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout { }

extension CategoryCollectionView: CategoryCollectionViewProtocol {
    func update(newItemList: [CategoryResponseModel]) {
        self.itemList = newItemList
    }
}

