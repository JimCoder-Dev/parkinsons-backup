import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var userMedications: UserMedications
    var body: some View {
        
        NavigationView{
            ZStack {
              
                VStack {
                    Text("Home View")
                    Symbols.homeicon
                    
                    Text("\(userMedications.medications.count)")
                    
                }
            }
            .navigationTitle("Home")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        .environmentObject(UserMedications())
        
    }
}
