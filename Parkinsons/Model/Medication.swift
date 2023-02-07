import SwiftUI

struct Medication: Identifiable{
    let id = UUID()
    var name: String
    var type: MedicineType
    var dosage: String = ""
    //var alarms: [Alarm] = []
    var numberOfAlarms:Int = 0
    
    
    static let example = Medication(name: "Please select a medication", type: .capsules , numberOfAlarms: 0)
}




