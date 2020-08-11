//
//  DetailsPresenter.swift
//  Teste Hotmart
//
//  Created by Rafa on 10/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import UIKit

protocol DetailsDelegate {
    func setupDetails(details: LocationDetails)
    func setupReviews(review: [Review])
}

class DetailsPresenter {
    
    var repository = LocationsRepository()
    private var locationDelegate: DetailsDelegate?
    
    func attachView(_ view: DetailsDelegate) {
        self.locationDelegate = view
    }
    
    func getDetails(identifier: Int) {
        repository.getDetails(identifier: identifier) { (response) in
            switch response {
            case .success(let location):
                self.locationDelegate?.setupDetails(details: location)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getReviews() -> [Review] {
        if let review = repository.loadJson() {
//            self.locationDelegate?.setupReviews(review: review)
            return review
        }
        return []
    }
}
