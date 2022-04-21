//
//  FavouriteCollectionView.swift
//  habit
//
//  Created by Canberk Bibican on 20.04.2022.
//

import UIKit

protocol FavouriteCollectionViewProtocol {
    var viewController: HomePageViewController? { get set }
    func update(newItemList: [FavouriteAnimalResponseModel])
}

protocol FavouriteCollectionViewOutPut: AnyObject {
    func onSelected(item: FavouriteAnimalResponseModel)
}

final class FavouriteCollectionView: NSObject {

    private lazy var itemList: [FavouriteAnimalResponseModel] = []
    weak var viewController: HomePageViewController?
    weak var delegate: FavouriteCollectionViewOutPut?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: FavouriteCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouriteCollectionViewCell.identifier, for: indexPath) as? FavouriteCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(favouriteModel: itemList[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.onSelected(item: itemList[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 200)
    }
}

extension FavouriteCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout { }

extension FavouriteCollectionView: FavouriteCollectionViewProtocol {
    func update(newItemList: [FavouriteAnimalResponseModel]) {
        self.itemList = newItemList
    }
}
