//
//  Schedules.swift
//  Teste Hotmart
//
//  Created by Rafa on 07/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import Foundation

struct  Schedules: Decodable {
    
    let monday: Schedule?
    let tuesday: Schedule?
    let wednesday: Schedule?
    let thursday: Schedule?
    let friday: Schedule?
    let saturday: Schedule?
    let sunday: Schedule?
    
    internal init(monday: Schedule?, tuesday: Schedule?, wednesday: Schedule?, thursday: Schedule?, friday: Schedule?, saturday: Schedule?, sunday: Schedule?) {
        self.monday = monday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
        self.sunday = sunday
    }
}

