//
//  OnBoardCollectionViewCell.swift
//  habit
//
//  Created by Canberk Bibican on 16.04.2022.
//

import UIKit

class OnBoardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnBoardCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setup(_ slide: OnboardingSlideModel){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
    
}
