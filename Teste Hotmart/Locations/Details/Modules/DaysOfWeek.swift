//
//  DaysOfWeek.swift
//  Teste Hotmart
//
//  Created by Rafa on 11/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import Foundation

enum Day {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

struct DaysOfWeek {
    let open: String?
    let close: String?
    let day: Day?
    
    
    public init(open: String?, close: String?, day: Day) {
        self.day = day
        self.close = close
        self.open = open
    }
}
