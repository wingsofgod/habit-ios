//
//  HomePageViewModel.swift
//  habit
//
//  Created by Canberk Bibican on 19.04.2022.
//

import Foundation

protocol IHomePageViewModel {
    func setDelegate(output: HomePageViewControllerOutPut)
    func getCategoryList()
    func getFavouriteList()
}

final class HomePageViewModel: IHomePageViewModel {

    var viewControllerOutput: HomePageViewControllerOutPut?

    func setDelegate(output: HomePageViewControllerOutPut) {
        viewControllerOutput = output
    }

    func getCategoryList() {
        ApiClient.request(ApiEndPoint.categoryList, loading: false) { [weak self] (_ result: Result<[CategoryResponseModel], Error>) in
            switch result {
            case .success(let response):
                self?.viewControllerOutput?.categoryListDataSuccess(data: response)
            case .failure(let error):
                self?.viewControllerOutput?.categoryListDataError(error: error)
            }
        }
    }

    func getFavouriteList() {
        ApiClient.request(ApiEndPoint.favouriteAnimalList, loading: false) { [weak self] (_ result: Result<[FavouriteAnimalResponseModel], Error>) in
            switch result {
            case .success(let response):
                self?.viewControllerOutput?.favouriteAnimalListDataSuccess(data: response)
            case .failure(let error):
                self?.viewControllerOutput?.favouriteAnimalListDataError(error: error)
            }
        }
    }
}
