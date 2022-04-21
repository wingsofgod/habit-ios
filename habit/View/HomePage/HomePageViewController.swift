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
    lazy var router: HomePageRoutingLogic = HomePageRouter()

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    private let myCategoryCollectionView: CategoryCollectionView = CategoryCollectionView()

    @IBOutlet weak var categoriesSeeAllText: UILabel!
    @IBOutlet weak var favouriteSeeAllText: UILabel!

    @IBOutlet weak var favouriteCollectionView: UICollectionView!
    private let myFavouriteCollectionView: FavouriteCollectionView = FavouriteCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func configure() {
        router.viewController = self
        homePageViewModel.setDelegate(output: self)
        homePageViewModel.getCategoryList()
        homePageViewModel.getFavouriteList()
        click()
    }

    private func click() {
        categoriesSeeAllText.addTapGesture { [weak self] in
            self?.router.route(.categoryListPage)
        }
        
        favouriteSeeAllText.addTapGesture { [weak self] in
            self?.router.route(.favouritePetListPage)
        }
    }

    private func initCategoryCollectionViewDelegate() {
        categoryCollectionView.delegate = myCategoryCollectionView
        categoryCollectionView.dataSource = myCategoryCollectionView
        myCategoryCollectionView.viewController = self
        myCategoryCollectionView.delegate = self
        CategoryCollectionViewCell.registerCellXib(with: categoryCollectionView)
    }

    private func initFavouriteCollectionViewDelegate() {
        favouriteCollectionView.delegate = myFavouriteCollectionView
        favouriteCollectionView.dataSource = myFavouriteCollectionView
        myFavouriteCollectionView.viewController = self
        myFavouriteCollectionView.delegate = self
        FavouriteCollectionViewCell.registerCellXib(with: favouriteCollectionView)
    }

}

extension HomePageViewController: CategoryCollectionViewOutPut {
    func onSelected(item: CategoryResponseModel) {
        print(item.id ?? "")
    }
}

extension HomePageViewController: FavouriteCollectionViewOutPut {
    func onSelected(item: FavouriteAnimalResponseModel) {
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
        myFavouriteCollectionView.update(newItemList: data)
        initFavouriteCollectionViewDelegate()
    }

    func favouriteAnimalListDataError(error: Error) {
        if self.presentedViewController == nil {
            alertDialog(title: "Error", message: error.localizedDescription) {
                print("Tapped Ok")
            }
        }
    }
}
