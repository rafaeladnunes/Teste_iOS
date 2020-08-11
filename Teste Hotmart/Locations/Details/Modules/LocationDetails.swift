//
//  LocationDetails.swift
//  Teste Hotmart
//
//  Created by Rafa on 07/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import UIKit

struct LocationDetails: Decodable {
    let id: Int
    let name: String
    let review: Double
    let type: String
    let about: String
    let phone: String
    let adress: String
//    let schedule: [String]
    
    public init(id: Int, name: String, review: Double, type: String, about: String, phone: String, adress: String) {
        self.id = id
        self.name = name
        self.review = review
        self.type = type
        self.about = about
        self.phone = phone
        self.adress = adress
//        self.schedule = schedule
    }
}

