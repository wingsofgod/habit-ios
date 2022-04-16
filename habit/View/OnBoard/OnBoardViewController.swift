//
//  OnBoardViewController.swift
//  habit
//
//  Created by Canberk Bibican on 16.04.2022.
//

import UIKit

class OnBoardViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    lazy var router: OnBoardRoutingLogic = OnBoardRouter()
    var slides: [OnboardingSlideModel] = []
    private let onBoardCollectionView: OnBoardCollectionView = OnBoardCollectionView()

    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Başla", for: .normal)
            } else {
                nextButton.setTitle("İlerle", for: .normal)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        router.viewController = self
        initCollectionViewDelegate()
    }

    private func initCollectionViewDelegate() {
        collectionView.delegate = onBoardCollectionView
        collectionView.dataSource = onBoardCollectionView
        onBoardCollectionView.viewController = self
        slides = [
            OnboardingSlideModel(title: "Öğren", description: "Bizimle birlikte yaşayan güzel dostlarımızı tanıyın ve onlar hakkında bilgiler edinin.", image: UIImage(named: "petInformation")!),
            OnboardingSlideModel(title: "Tanı", description: "Dostlarımızın türlerine özel bilgileri detaylı şekilde öğrenin ve onların yaşamlarına yardımcı olun.", image: UIImage(named: "petRecognize")!),
            OnboardingSlideModel(title: "Sahiplen", description: "İlanlarımızdan kendinize bir hayat arkadaşı seçin ve onu sahiplenin. Her zaman dediğimiz gibi satın alma sahiplen.", image: UIImage(named: "petAdoptaion")!)
        ]
        onBoardCollectionView.update(newItemList: slides)
        pageControl.numberOfPages = slides.count
    }

    @IBAction func nextButtonTap(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            router.route(.homePage)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}
