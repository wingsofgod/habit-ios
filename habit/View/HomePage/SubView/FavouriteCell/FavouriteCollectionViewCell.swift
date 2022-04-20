//
//  FavouriteCollectionViewCell.swift
//  habit
//
//  Created by Canberk Bibican on 20.04.2022.
//

import UIKit

class FavouriteCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: FavouriteCollectionViewCell.self)
    @IBOutlet weak var favouriteImageView: UIImageView!
    @IBOutlet weak var favouriteLabel: UILabel!
    
    func setup(favouriteModel: FavouriteAnimalResponseModel) {
        favouriteImageView.forURL(favouriteModel.image ?? "", fail: { error in
            //self.imageView?.image = defaultImage
            print(error.errorCode)
        })
        favouriteImageView.contentMode = .scaleAspectFill
        favouriteLabel.text = favouriteModel.name ?? ""

    }

}
