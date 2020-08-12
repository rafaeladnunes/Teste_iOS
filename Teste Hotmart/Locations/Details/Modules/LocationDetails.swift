import Foundation

struct LocationDetails: Decodable {
    let id: Int
    let name: String
    let review: Double
    let type: String
    let about: String
    let phone: String
    let adress: String
    let schedule: Schedules
    
    public init(id: Int, name: String, review: Double, type: String, about: String, phone: String, adress: String, schedule: Schedules) {
        self.id = id
        self.name = name
        self.review = review
        self.type = type
        self.about = about
        self.phone = phone
        self.adress = adress
        self.schedule = schedule
    }
    
    func formattedSchedule() -> String{
        return schedule.formatSchedule(formatter: ScheduleDetailFormatter())
    }
}

