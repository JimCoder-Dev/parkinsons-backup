import SwiftUI

class SelectedMedication: ObservableObject, Identifiable{
    
    @Published var medication: Medication? = nil
    
    @Published var selectedDosage: Int = 0
    @Published var userTimesPerDay = 0
    @Published var selectedAmount: Int = 1
    
    
    @Published var isAMedicationSelected = false
//    Screen cover
    @Published var showMedications = false
    
    
    // TOGGLE SWITCH
    @State var isAlarmActive = false
    
    
   
    
    @Published var alarms: [Alarm] = []
    
    
    
    func addAlarm(){
        
    }
    
    
    
    //Array location for numberOftimesPerDay
//    var totalNumberOfAlarms: Int{
//        switch selectedAmount{
//        case 1, 5, 7, 11:
//            return 1
//        case 2, 3, 9, 10:
//            return 2
//        case 4, 6, 8:
//            return 3
//        case 12:
//            return 4
//        default:
//            return 0
//        }
//    }
    
    
    
    
}
