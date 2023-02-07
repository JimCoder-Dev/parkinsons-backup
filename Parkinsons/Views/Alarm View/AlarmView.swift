import SwiftUI

struct AlarmView: View {
    
    @EnvironmentObject var userMedications: UserMedications
    
    
    
    var body: some View {
        NavigationView{
            List(userMedications.medications){ medication in

                
                
                
                Section{
                    Toggle(isOn: medication.$isAlarmActive) {
                        Text("Is the alarm active")
                    }
                }header: {
                    Text(medication.medication?.name ?? "")
                }
                
                
                
                
                
                
                
                
                
                
              
            }
            .listStyle(PlainListStyle())
            .padding(.horizontal)
            .navigationTitle("Alarms")
        }
        
        
    }
}


struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
            .environmentObject(UserMedications())
        
    }
}




struct AlarmHeading: View {
    
    let title: String
    let color: Color
    
    var body: some View {
        ZStack{
            color
            HStack(spacing: 12){
                    Image(systemName: "sun.max.fill")
                    Text(title)
            }
            .padding(.leading)
            .foregroundColor(.white)
            .font(.title)
        }
    }
}
