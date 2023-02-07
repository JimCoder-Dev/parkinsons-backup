
import SwiftUI

struct TabController: View {
    @StateObject var userMedications = UserMedications()

    
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Symbols.homeicon
                    Text("Home")
                    
                }
            MedicationView()
                .tabItem{
                    Symbols.medicationicon
                    Text("Medications")
                }
            AlarmView()
                .tabItem{
                    Symbols.alarmicon
                    Text("Alarms")
                }
        }
        .environmentObject(userMedications)
    }
}

struct TabController_Previews: PreviewProvider {
    static var previews: some View {
        TabController()
            .environmentObject(UserMedications())
    }
}
