//
//  CategoryListTableViewCell.swift
//  habit
//
//  Created by Canberk Bibican on 21.04.2022.
//

import UIKit

class CategoryListTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: CategoryListTableViewCell.self)
    
    @IBOutlet weak var categoryDescription: UILabel!
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(categoryModel: CategoryResponseModel) {
        
        categoryImageView.forURL(categoryModel.image ?? "", fail: { error in
            //self.imageView?.image = defaultImage
            print(error.errorCode)
        })
        categoryImageView.contentMode = .scaleAspectFill
        categoryTitle.text = categoryModel.name ?? ""
        categoryDescription.text = "Description description description description description description description description description description description description description description"
         
    }
    
}
