//
//  Review.swift
//  Teste Hotmart
//
//  Created by Rafa on 10/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import UIKit

struct Reviews: Decodable {
    let review: [Review]
}

struct Review: Decodable {
    let evaluation: String
    let about: String
    let information: String
    let review: Double
    
    public init(evaluation: String, about: String, information: String, review: Double) {
        self.evaluation = evaluation
        self.about = about
        self.information = information
        self.review = review
    }
}
