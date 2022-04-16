//
//  SplashViewController.swift
//  habit
//
//  Created by Canberk Bibican on 15.04.2022.
//

import UIKit

class SplashViewController: BaseViewController {
    
    lazy var router: SplashRoutingLogic = SplashRouter()
    @IBOutlet weak var splashImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        router.viewController = self
        
        configure()
        animation()
    }

    private func animation() {
        UIView.animate(withDuration: 1.5) {
            self.splashImageView.alpha = 1
        } completion: { (done) in
            if(done) {
                UIView.animate(withDuration: 1.5) {
                    self.splashImageView.alpha = 0
                } completion: { (done) in
                    if(done) {
                        self.router.route(.onBoard)
                    }
                }
            }
        }
    }

    private func configure() {
        splashImageView.translatesAutoresizingMaskIntoConstraints = false
        splashImageView.alpha = 0
    }

}

