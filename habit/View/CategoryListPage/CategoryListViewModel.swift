//
//  CategoryListViewModel.swift
//  habit
//
//  Created by Canberk Bibican on 21.04.2022.
//

import Foundation

protocol ICategoryListViewModel {
    func setDelegate(output: CategoryListViewControllerOutPut)
    func getCategoryList()
}

final class CategoryListViewModel: ICategoryListViewModel {

    var viewControllerOutput: CategoryListViewControllerOutPut?

    func setDelegate(output: CategoryListViewControllerOutPut) {
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
}
