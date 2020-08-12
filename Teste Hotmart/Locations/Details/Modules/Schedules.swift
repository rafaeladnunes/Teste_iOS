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
    
    func getSchedules() -> String {
        var listDays: Array<DaysOfWeek> = Array()
        listDays.append(DaysOfWeek(open: self.monday?.open, close: self.monday?.close, day: Day.monday))
        listDays.append(DaysOfWeek(open: self.tuesday?.open, close: self.tuesday?.close, day: Day.tuesday))
        listDays.append(DaysOfWeek(open: self.wednesday?.open, close: self.wednesday?.close, day: Day.wednesday))
        listDays.append(DaysOfWeek(open: self.thursday?.open, close: self.thursday?.close, day: Day.thursday))
        listDays.append(DaysOfWeek(open: self.friday?.open, close: self.friday?.close, day: Day.friday))
        listDays.append(DaysOfWeek(open: self.saturday?.open, close: self.saturday?.close, day: Day.saturday))
        listDays.append(DaysOfWeek(open: self.sunday?.open, close: self.sunday?.close, day: Day.sunday))
        
//        var days = Dictionary(grouping: listDays, by: { $0.open})
    }
}

