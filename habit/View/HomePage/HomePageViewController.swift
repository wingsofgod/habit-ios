//
//  HomePageViewController.swift
//  habit
//
//  Created by Canberk Bibican on 16.04.2022.
//

import UIKit

protocol HomePageViewControllerOutPut {
    func categoryListDataSuccess(data: [CategoryResponseModel])
    func categoryListDataError(error: Error)

    func favouriteAnimalListDataSuccess(data: [FavouriteAnimalResponseModel])
    func favouriteAnimalListDataError(error: Error)
}

class HomePageViewController: UIViewController {

    lazy var homePageViewModel: IHomePageViewModel = HomePageViewModel()
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    private let myCategoryCollectionView: CategoryCollectionView = CategoryCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        homePageViewModel.setDelegate(output: self)
        homePageViewModel.getCategoryList()
        homePageViewModel.getFavouriteList()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    private func initCategoryCollectionViewDelegate() {
        categoryCollectionView.delegate = myCategoryCollectionView
        categoryCollectionView.dataSource = myCategoryCollectionView
        myCategoryCollectionView.viewController = self
        myCategoryCollectionView.delegate = self
        CategoryCollectionViewCell.registerCellXib(with: categoryCollectionView)
    }

}

extension HomePageViewController: CategoryCollectionViewOutPut {
    func onSelected(item: CategoryResponseModel) {
        print(item.id ?? "")
    }
}

extension HomePageViewController: HomePageViewControllerOutPut {

    func categoryListDataSuccess(data: [CategoryResponseModel]) {
        myCategoryCollectionView.update(newItemList: data)
        initCategoryCollectionViewDelegate()
    }

    func categoryListDataError(error: Error) {
        if self.presentedViewController == nil {
            alertDialog(title: "Error", message: error.localizedDescription) {
                print("Tapped Ok")
            }
        }
    }

    func favouriteAnimalListDataSuccess(data: [FavouriteAnimalResponseModel]) {
        print(data)
    }

    func favouriteAnimalListDataError(error: Error) {
        if self.presentedViewController == nil {
            alertDialog(title: "Error", message: error.localizedDescription) {
                print("Tapped Ok")
            }
        }
    }
}
