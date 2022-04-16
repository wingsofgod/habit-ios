//
//  OnBoardCollectionView.swift
//  habit
//
//  Created by Canberk Bibican on 16.04.2022.
//

import UIKit

protocol OnBoardCollectionViewProtocol {
    var viewController: OnBoardViewController? { get set }
    func update(newItemList: [OnboardingSlideModel])
}

final class OnBoardCollectionView: NSObject {

    private lazy var itemList: [OnboardingSlideModel] = []
    weak var viewController: OnBoardViewController?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: OnBoardCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardCollectionViewCell.identifier, for: indexPath) as? OnBoardCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(itemList[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        viewController?.currentPage = Int(scrollView.contentOffset.x / width)
    }
}

extension OnBoardCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout { }

extension OnBoardCollectionView: OnBoardCollectionViewProtocol {

    func update(newItemList: [OnboardingSlideModel]) {
        self.itemList = newItemList
    }
}
