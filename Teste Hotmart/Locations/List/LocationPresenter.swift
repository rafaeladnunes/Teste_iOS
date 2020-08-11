//
//  LocationPresenter.swift
//  Teste Hotmart
//
//  Created by Rafa on 10/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import UIKit

protocol LocationDelegate {
    func setupLocations(locations: Locations)
}

class LocationPresenter {
    
    var repository = LocationsRepository()
    private var locationDelegate: LocationDelegate?
    
    func attachView(_ view: LocationDelegate) {
        self.locationDelegate = view
    }
    
    func getLocations() {
        repository.getLocations { (response) in
            switch response {
            case .success(let location):
                self.locationDelegate?.setupLocations(locations: location)
            case .failure(let error):
                print(error)
            }
        }
    }
}
