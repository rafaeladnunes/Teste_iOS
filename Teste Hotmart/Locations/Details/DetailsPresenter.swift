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
    
    func getDaysofWeek(schedules: Schedules) {
//        let days = DaysOfWeek(days: [schedules.friday, schedules.monday, schedules.saturday, schedules.sunday, schedules.thursday, schedules.tuesday, schedules.wednesday])
//        let day = days.days.map { $0?.open ==  }
    }
    
    func getReviews() -> [Review] {
        if let review = repository.loadJson() {
            return review
        }
        return []
    }
}
