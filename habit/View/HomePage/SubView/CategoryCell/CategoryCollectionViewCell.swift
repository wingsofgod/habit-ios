//
//  CategoryCollectionViewCell.swift
//  habit
//
//  Created by Canberk Bibican on 19.04.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: CategoryCollectionViewCell.self)
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var cardView: CardView!
    
    func setup(categoryModel: CategoryResponseModel) {
        categoryImageView.forURL(categoryModel.image ?? "", fail: { error in
            //self.imageView?.image = defaultImage
            print(error.errorCode)
        })
        categoryImageView.contentMode = .scaleAspectFill
        categoryLabel.text = categoryModel.name ?? ""

    }

}
