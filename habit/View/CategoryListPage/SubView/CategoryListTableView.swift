//
//  CategoryListTableView.swift
//  habit
//
//  Created by Canberk Bibican on 21.04.2022.
//

import UIKit

protocol CategoryListTableViewProtocol {
    func update(newItemList: [CategoryResponseModel])
}

protocol CategoryListTableViewOutput: AnyObject {
    func onSelected(item: CategoryResponseModel)
}

final class CategoryListTableView: NSObject {

    private lazy var itemList: [CategoryResponseModel] = []

    /// Json TableView Output Delegate
    weak var delegate: CategoryListTableViewOutput?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell: CategoryListTableViewCell = tableView.dequeueReusableCell(withIdentifier: CategoryListTableViewCell.identifier) as? CategoryListTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(categoryModel: itemList[indexPath.row])
        cell.selectionStyle = .none
        //let image = UIImageView(image: UIImage(named: "petRecognize")!)
        //image.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        //cell.accessoryView = image
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(item: itemList[indexPath.row])
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension CategoryListTableView: UITableViewDelegate, UITableViewDataSource { }

extension CategoryListTableView: CategoryListTableViewProtocol {
    func update(newItemList: [CategoryResponseModel]) {
        self.itemList = newItemList
    }
}
