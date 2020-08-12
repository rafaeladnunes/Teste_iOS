import Foundation

struct ScheduleDetailFormatter {
    
    func format(_ groupedSchedule : WeekSchedule) ->String{
        if(groupedSchedule.isSingleDay()) {
            return getSingleDaySchedule(groupedSchedule)
        } else if(groupedSchedule.isInSequence()) {
            return getInSequenceSchedule(groupedSchedule)
        } else {
            return getNotInSequenceSchedule(groupedSchedule)
        }
    }
    
    private func getSingleDaySchedule(_ groupedSchedule: WeekSchedule) -> String {
        let day = getShortWeekDay(groupedSchedule.firstDay()!)
        let open = groupedSchedule.open
        let close = groupedSchedule.close
        
        let format = NSLocalizedString("singleDayTemplate", comment: "")
        return String(format: format, day, open, close)
    }
    
    private func getInSequenceSchedule(_ groupedSchedule: WeekSchedule) -> String {
        let firstDay = getShortWeekDay(groupedSchedule.firstDay()!)
        let lastDay = getShortWeekDay(groupedSchedule.lastDay()!)
        let open = groupedSchedule.open
        let close = groupedSchedule.close
        
        let format = NSLocalizedString("inSequenceDaysTemplate", comment: "")
        return String(format: format, firstDay, lastDay, open, close)
    }
    
    private func getNotInSequenceSchedule(_ groupedSchedule: WeekSchedule) -> String {
        let lastDay = getShortWeekDay(groupedSchedule.lastDay()!)
        let open = groupedSchedule.open
        let close = groupedSchedule.close
        
        var shotWeekDays = String()
        
        groupedSchedule.days.forEach{ day in
            let day = getShortWeekDay(day)
            shotWeekDays.append("\(day), ")
        }
        
        shotWeekDays = shotWeekDays.replacingOccurrences(of: ", \(lastDay), ", with: "")
        
        let format = NSLocalizedString("notInSequenceDaysTemplate", comment: "")
        return String(format: format, shotWeekDays, lastDay, open, close)
    }
    
    private func getShortWeekDay(_ day: Day) -> String{
        let shortWeekDays = getLocalizedFormatter().shortWeekdaySymbols!
        
        if(day == .sunday){
            return shortWeekDays[0].lowercased()
        }else{
            return shortWeekDays[day.rawValue].lowercased()
        }
    }
    
    private func getLocalizedFormatter() -> DateFormatter{
        let formatter =  DateFormatter()
        formatter.locale = Locale(identifier: NSLocale.preferredLanguages.first!)
        return formatter
    }
}
