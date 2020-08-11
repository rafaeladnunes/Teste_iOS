//
//  Locations.swift
//  Teste Hotmart
//
//  Created by Rafa on 10/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import Foundation

struct Locations: Decodable {
    let listLocations: [Location]
    
    public init(list: [Location]) {
        self.listLocations = list
    }
}
