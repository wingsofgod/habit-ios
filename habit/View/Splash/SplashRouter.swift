//
//  SplashRouter.swift
//  habit
//
//  Created by Canberk Bibican on 16.04.2022.
//

import Foundation
import UIKit

enum SplashRouting: String{
    case onBoard = "onBoardVC"
    case homePage = "homePageVC"
}

protocol SplashRoutingLogic: AnyObject {
    var viewController: SplashViewController? { get set }
    func route(_ routing: SplashRouting)
}

final class SplashRouter: SplashRoutingLogic {
    
    weak var viewController: SplashViewController?

    func route(_ routing: SplashRouting) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: routing.rawValue)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        viewController?.present(vc, animated: false, completion: nil)
        //viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
