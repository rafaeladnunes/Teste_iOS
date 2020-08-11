//
//  Location.swift
//  Teste Hotmart
//
//  Created by Rafa on 06/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import UIKit

struct Location: Decodable {
    let id: Int
    let name: String
    let review: Double
    let type: String
    
    public init(id: Int, name: String, review: Double, type: String) {
        self.id = id
        self.name = name
        self.review = review
        self.type = type
    }
}
