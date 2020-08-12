import Foundation

struct WeekSchedule{
    
    let open: String
    let close: String
    let days : Array<Day>
    
    internal init(_ open: String,_ close: String,_ days: Array<Day>) {
        self.open = open
        self.close = close
        self.days = days
    }
    
    func firstDay() -> Day?{
        return days.first
    }
    
    func lastDay() -> Day?{
        return days.last
    }
    
    func isSingleDay() -> Bool{
        return days.count == 1
    }
    
    func isInSequence() -> Bool{
        if(days.count < 3) {return false}
        
        var isInSequence = true
        var currentDay = days[0].rawValue
        
        days.forEach{ day in
            isInSequence = isInSequence && day.rawValue == currentDay
            
            currentDay += 1
        }
        
        return isInSequence
    }
}
