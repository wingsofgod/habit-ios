//
//  HomePageRouter.swift
//  habit
//
//  Created by Canberk Bibican on 21.04.2022.
//

import Foundation
import UIKit

enum HomePageRouting: String{
    case categoryListPage = "categoryListVC"
    case favouritePetListPage = "favouritePetListVC"
    //case petDetailPage = "petDetailPage"
}

protocol HomePageRoutingLogic: AnyObject {
    var viewController: HomePageViewController? { get set }
    func route(_ routing: HomePageRouting)
}

final class HomePageRouter: HomePageRoutingLogic {
    
    weak var viewController: HomePageViewController?

    func route(_ routing: HomePageRouting) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: routing.rawValue)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
