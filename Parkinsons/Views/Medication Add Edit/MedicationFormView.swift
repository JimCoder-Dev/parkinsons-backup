import SwiftUI

struct MedicationFormView: View {
    
    
    let addOrEdit: MedicationAdjustment
    @EnvironmentObject var smvm: SelectedMedication
    //back to the home screen
    @Environment(\.dismiss) private var dismiss
    
    //All of the users medications in their routine
    @EnvironmentObject var userMedications:  UserMedications
    
    let amountOptions = ["50mg", "100mg", "150mg", "250mg"]
    
    
    var body: some View {
        NavigationStack{
            Form{
                medicationlink
                dosage
                amount
                pillrequirement
                savemedicationbutton
            }
            .navigationTitle("\(addOrEdit.rawValue) Medication")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $smvm.showMedications){
                MedicationCategoryView()
            }
            
        }
    }
}

struct MedicationFormView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationFormView(addOrEdit: .add)
            .environmentObject(UserMedications())
            .environmentObject(SelectedMedication())
    }
}


private extension MedicationFormView{
    
    var medicationlink: some View{
        Section("Selected Medication"){
            Button{
                smvm.showMedications.toggle()
               
            }label: {
                HStack{
                    Text(smvm.medication!.name)
                    Spacer()
                    Symbols.pills
                }
                .foregroundColor(.secondary)
            }
            
        }
    }
    
    var dosage: some View{
        Section("Select dosage"){
            Picker("dosage", selection: $smvm.selectedDosage){
                ForEach(amountOptions.indices, id: \.self){
                    Text(amountOptions[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
    
    var amount: some View{
        Section("Amount per day") {
            VStack(alignment: .leading){
                HStack{
                    
                    Button{
                        smvm.selectedAmount -= 1
                        smvm.userTimesPerDay = 0
                    }label: {
                        ButtonLabel(iconName: "minus")
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .disabled(smvm.selectedAmount == 1)
                        
                    Spacer()
                    Button{
                        smvm.selectedAmount += 1
                        smvm.userTimesPerDay = 0
                    }label: {
                        ButtonLabel(iconName: "plus")
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .disabled(smvm.selectedAmount == 12)
                }.padding()
                
            }
            HStack{
                Spacer()
                Text("Selected: \(smvm.selectedAmount)")
            }
        }
    }
    
    
    
    var pillrequirement: some View{
      
            
        Section("How many times per day?"){
            Text("Total number of possible alarms: \(numberOfTimesPerDay.count)")
            
            if numberOfTimesPerDay.count == 1{
                Text("Once per Day")
            }
            else{
                
                VStack {
                    HStack{
                        Button{
                            smvm.userTimesPerDay -= 1
                        }label: {
                            ButtonLabel(iconName: "minus")
                        }
                        .disabled(smvm.userTimesPerDay + 1 == 1)
                        .buttonStyle(BorderlessButtonStyle())
                        Spacer()
                        Button{
                            smvm.userTimesPerDay += 1
                        }label: {
                            ButtonLabel(iconName: "plus")
                        }
                        .disabled(smvm.userTimesPerDay + 1 == numberOfTimesPerDay.count)
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    VStack(alignment: .leading){
                        Text("\(numberOfTimesPerDay[smvm.userTimesPerDay]) \(numberOfTimesPerDay[smvm.userTimesPerDay] > 1 ? "Alarms" : "Alarm") ")
                        Text("\(smvm.selectedAmount / numberOfTimesPerDay[smvm.userTimesPerDay]) pills")
                    }
                    
                }
            }
        }
            
                
                
                
                
           
        
       
        
    }
    
    
    @ViewBuilder
    var savemedicationbutton: some View{
        
        if smvm.isAMedicationSelected {
            Section{
                Button{
                    if addOrEdit == .add{
                        
                        
                        
                        userMedications.medications.append(smvm)
                    }
                    defer{
                        print(userMedications.medications)}
                   
                    
                    dismiss()
                }label: {
                    Text("Save Medication")
                }
            }
        }
            
      
        
        
        
    }
    
    
    var numberOfTimesPerDay: [Int]{
        switch smvm.selectedAmount{
        case 1, 5, 7, 11:
            return [1]
            //only 1 alarm for each number of pills
        case 2:
            return [1, 2]
            //1 alarm 2 pills, 2 Alarms 1 pill each alarm
        case 3:
            return [1, 3]
            //1 alarm 3 pills per alarm - 3 alarms 1 pill each alarm
        case 4:
            return [1, 2, 4]
            // 1 alarm 4 pills - 2 alarms 2 pills per alarm - 4 alarms 1 alarm per pill
        case 6:
            return [1, 2, 3]
            // 1 alarm 6 pilss - 2 alarms 3 pills per alarm - 3 alarms - 2 pills per alarm
        case 8:
            return [1, 2, 4]
            // 1 alarm 8 pills - 2 alarms 4 pills per alarm  - 4 alarms 2 pills per alarm
        case 9:
            return [1, 3]
            //1 alarm 9 pills - 3 alarms 3 pills
        case 10:
            return [1, 2]
            // 1 alarm 10 pills - 2 alarms 5 pills
        case 12:
            return [1, 2, 3, 4]
            // 1 alarm 12 pills - 2 alarms 6 pills per alarm - 3 alarms 4 pills per alarm - 4 alarms 3 pills per alarm
        default:
            return [0]
            
        }
    }
}






