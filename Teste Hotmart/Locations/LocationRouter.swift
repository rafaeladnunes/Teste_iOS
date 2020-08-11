//
//  LocationRouter.swift
//  Teste Hotmart
//
//  Created by Rafa on 06/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import UIKit

class LocationRouter {
    
    func showDetailsR(identifier: Int, viewController: UIViewController) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Details", bundle: nil)
        let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "detailsViewController") as! DetailsViewController
        detailsViewController.identifier = identifier
        viewController.present(detailsViewController, animated: true, completion: nil)
    }
}

extension LocationRouter: HomeViewControllerDelegate {
    
    func showDetails(identifier: Int, viewController: UIViewController) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Details", bundle: nil)
        let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "detailsViewController") as! DetailsViewController
        detailsViewController.identifier = identifier
        viewController.present(detailsViewController, animated: true, completion: nil)
    }
    
}
