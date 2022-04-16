//
//  OnBoardRouter.swift
//  habit
//
//  Created by Canberk Bibican on 16.04.2022.
//

import Foundation
import UIKit

enum OnBoardRouting: String{
    case homePage = "homePageVC"
}

protocol OnBoardRoutingLogic: AnyObject {
    var viewController: OnBoardViewController? { get set }
    func route(_ routing: OnBoardRouting)
}

final class OnBoardRouter: OnBoardRoutingLogic {
    
    weak var viewController: OnBoardViewController?

    func route(_ routing: OnBoardRouting) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: routing.rawValue)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        viewController?.present(vc, animated: true, completion: nil)
    }
}
