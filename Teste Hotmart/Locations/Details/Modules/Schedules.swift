//
//  Schedules.swift
//  Teste Hotmart
//
//  Created by Rafa on 07/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import Foundation

struct  Schedules: Decodable {
    let schedule: [Schedule]
    
    public init(days: [Schedule]) {
        self.schedule = days
    }
}
