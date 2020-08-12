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
        groupScheduleByWorkingTime().forEach{groupedSchedule in
            formattedSchedule.append("\(formatter.format(groupedSchedule))\n")
        }
        
        return formattedSchedule
    }
    
    private func groupScheduleByWorkingTime() -> Array<GroupedSchedule>{
        let scheduleDays = createScheduleDays()
        return Dictionary(grouping: scheduleDays, by: { $0.open + $0.close })
            .map{ (key, scheduleDays) in
                let open = scheduleDays[0].open
                let close = scheduleDays[0].close
                let days = scheduleDays.map({ $0.day })
                
                return GroupedSchedule(open, close, days)
        }
    }
    
    private func createScheduleDays() -> Array<ScheduleDay>{
        var scheduleDays: Array<ScheduleDay> = Array()
        if let monday = self.monday { scheduleDays.append(ScheduleDay(open: monday.open, close: monday.close, day: Day.monday)) }
        if let tuesday = self.tuesday { scheduleDays.append(ScheduleDay(open: tuesday.open, close: tuesday.close, day: Day.tuesday)) }
        if let wednesday = self.wednesday { scheduleDays.append(ScheduleDay(open: wednesday.open, close: wednesday.close, day: Day.wednesday)) }
        if let thursday = self.thursday { scheduleDays.append(ScheduleDay(open: thursday.open, close: thursday.close, day: Day.thursday)) }
        if let friday = self.friday { scheduleDays.append(ScheduleDay(open: friday.open, close: friday.close, day: Day.friday)) }
        if let saturday = self.saturday { scheduleDays.append(ScheduleDay(open: saturday.open, close: saturday.close, day: Day.saturday)) }
        if let sunday = self.sunday { scheduleDays.append(ScheduleDay(open: sunday.open, close: sunday.close, day: Day.sunday)) }
        
        return scheduleDays
    }
}
