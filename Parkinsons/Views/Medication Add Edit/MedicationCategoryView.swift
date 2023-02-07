import SwiftUI

struct MedicationCategoryView: View {

    let allMedications: [MedicationCategory] = [.levodopa, .dopamineAgonists, .MAOB, .COMT]
    
    @EnvironmentObject var selectedMedicationVM: SelectedMedication
   
   
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List(allMedications, children: \.items){ medication in
                if(medication.name == "Levodopa" || medication.name == "Dopamine agonists" || medication.name == "COMT inhibitors" || medication.name == "MAO-B inhibitors"){
            
                    Text(medication.name)
                        .font(.system(size: 44, design: .monospaced))
                        .bold()
                        .listRowBackground(Color.teal)
                        .frame(height: 120)
                        .padding(.horizontal)
                        .padding(.vertical)
                    
                }
                else{
                    Button{
                        selectedMedicationVM.medication = Medication(name: medication.name, type: .capsules)
                        selectedMedicationVM.isAMedicationSelected = true
                        dismiss()
                    }label: {
                        Text(medication.name)
                            .fontWeight(.semibold)
                    }
                    .padding()
                }
        }
        .listStyle(PlainListStyle())
        
        Button("Cancel Selection"){
            dismiss()
        }
        .padding()
    }
}

struct MedicationCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationCategoryView()
    }
}
