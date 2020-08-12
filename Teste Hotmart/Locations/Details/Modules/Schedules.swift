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
    
    func formatSchedule(formatter: ScheduleDetailFormatter) -> String{
        var formattedSchedule = ""
        getWeekSchedules().forEach{groupedSchedule in
            formattedSchedule.append("\(formatter.format(groupedSchedule))\n")
        }
        
        return formattedSchedule
    }
    
    private func getWeekSchedules() -> Array<WeekSchedule>{
        let scheduleDays = createDaySchedules()
        return Dictionary(grouping: scheduleDays, by: { $0.open + $0.close })
            .map{ (key, scheduleDays) in
                let open = scheduleDays[0].open
                let close = scheduleDays[0].close
                let days = scheduleDays.map({ $0.day })
                
                return WeekSchedule(open, close, days)
        }
    }
    
    private func createDaySchedules() -> Array<DaySchedule>{
        var scheduleDays: Array<DaySchedule> = Array()
        if let monday = self.monday { scheduleDays.append(DaySchedule(open: monday.open, close: monday.close, day: Day.monday)) }
        if let tuesday = self.tuesday { scheduleDays.append(DaySchedule(open: tuesday.open, close: tuesday.close, day: Day.tuesday)) }
        if let wednesday = self.wednesday { scheduleDays.append(DaySchedule(open: wednesday.open, close: wednesday.close, day: Day.wednesday)) }
        if let thursday = self.thursday { scheduleDays.append(DaySchedule(open: thursday.open, close: thursday.close, day: Day.thursday)) }
        if let friday = self.friday { scheduleDays.append(DaySchedule(open: friday.open, close: friday.close, day: Day.friday)) }
        if let saturday = self.saturday { scheduleDays.append(DaySchedule(open: saturday.open, close: saturday.close, day: Day.saturday)) }
        if let sunday = self.sunday { scheduleDays.append(DaySchedule(open: sunday.open, close: sunday.close, day: Day.sunday)) }
        
        return scheduleDays
    }
}
