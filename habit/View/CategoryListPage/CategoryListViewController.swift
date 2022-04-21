//
//  CategoryListViewController.swift
//  habit
//
//  Created by Canberk Bibican on 21.04.2022.
//

import UIKit

protocol CategoryListViewControllerOutPut {
    func categoryListDataSuccess(data: [CategoryResponseModel])
    func categoryListDataError(error: Error)
}

class CategoryListViewController: UIViewController {

    lazy var categoryListViewModel: ICategoryListViewModel = CategoryListViewModel()

    @IBOutlet weak var categoryListTableView: UITableView!
    private lazy var myCategoryListTableView: CategoryListTableView = CategoryListTableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Categories"
        categoryListViewModel.setDelegate(output: self)
        initTableViewDelegate()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        categoryListViewModel.getCategoryList()
    }

    private func initTableViewDelegate() {
        categoryListTableView.delegate = myCategoryListTableView
        categoryListTableView.dataSource = myCategoryListTableView
        myCategoryListTableView.delegate = self
        CategoryListTableViewCell.registerCellXib(with: categoryListTableView)
        categoryListTableView.separatorColor = .clear
        categoryListTableView.estimatedRowHeight = UITableView.automaticDimension
        categoryListTableView.rowHeight = UITableView.automaticDimension
    }

}

extension CategoryListViewController: CategoryListTableViewOutput {
    func onSelected(item: CategoryResponseModel) {
        print(item)
    }
}

extension CategoryListViewController: CategoryListViewControllerOutPut {
    func categoryListDataSuccess(data: [CategoryResponseModel]) {
        myCategoryListTableView.update(newItemList: data)
        categoryListTableView.reloadData()
    }

    func categoryListDataError(error: Error) {
        print(error)
    }
}
