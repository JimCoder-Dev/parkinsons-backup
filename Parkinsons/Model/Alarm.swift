import Foundation

struct Alarm: Identifiable{
    var id = UUID()
    var time: Date
    var isActive: Bool = false
    var timeOfDay: AlarmTime
}


