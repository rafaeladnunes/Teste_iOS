import Foundation

enum Day : Int {
    case monday = 1
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

struct ScheduleDay {
    let open: String
    let close: String
    let day: Day
    
    
    public init(open: String, close: String, day: Day) {
        self.day = day
        self.close = close
        self.open = open
    }
}
