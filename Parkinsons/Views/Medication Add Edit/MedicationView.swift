import SwiftUI

struct MedicationView: View {
    
    
    @State private var addMedication = false
    @EnvironmentObject var userMedications: UserMedications
    
    
    
    @StateObject var smvm = SelectedMedication()
    
   
    @State private var isNavigationActive = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                if userMedications.medications.count < 1{
                    placeholder
                    
                }else{
                    List{
                        ForEach(userMedications.medications){ medication in
                            
                            
                            
                            Button{
                                isNavigationActive = true
                               
                            }label: {
                                MedicationRowItem(medication: medication.medication ?? Medication.example)
                            }
                            .buttonStyle(BorderlessButtonStyle())
//                            .background(
//                                ZStack{
//                                    
//                                    
//                                    NavigationLink(isActive: $smvm.isAMedicationSelected) {
//                                        MedicationFormView(addOrEdit: .edit)
//                                    } label: {
//                                        EmptyView()
//                                    }
//
//                                }
//                                .opacity(0)
//                                
//                            )
                           
                          
                            
                            
//                            NavigationLink{
//                                MedicationFormView(addOrEdit: .edit)
//
//                            } label: {
//
//
//                            }
                           
                            
                            
                            
                        }
//                        .onDelete(perform: delete)
                    }
                    
                }
                
            }
            .navigationTitle("Medications")
            .toolbar{
                ToolbarItem(placement: .primaryAction){
                    add
                }
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
            }
            .fullScreenCover(isPresented: $addMedication){
                MedicationFormView(addOrEdit: .add)

            }
        }
        .environmentObject(smvm)
        
        
        
    }
    
    
    func delete(at offsets: IndexSet){
        userMedications.medications.remove(atOffsets: offsets)
    }
}



struct MedicationView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationView()
            .environmentObject(UserMedications())
            .environmentObject(SelectedMedication())
            
    }
}


private extension MedicationView{
    
    var placeholder: some View{
        VStack(spacing: 0){
            Symbols.pills
                .font(.system(size: 80))
                .foregroundColor(.cyan)
            Text("Please add a medication your rountine to get started.")
                .lineLimit(10)
                .font(.system(size: 34, design: .monospaced))
                .fontWeight(.semibold)
    
                
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 12)
        
    }
    
    var add: some View{
        Button{
            smvm.medication = Medication.example
            smvm.isAMedicationSelected = false
            
            smvm.selectedDosage = 0
            smvm.userTimesPerDay = 0
            smvm.selectedAmount = 1
            print(smvm.medication)
            
            addMedication.toggle()
        }label: {
            Symbols.plus
                .font(.system(.title2, design: .rounded).bold())
        }
    }
}
