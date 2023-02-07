import SwiftUI

struct MedicationRowItem: View {

    let medication: Medication
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(medication.name)
            Text("\(medication.numberOfAlarms) alarms")
            Text(medication.dosage)
            Text(medication.id.uuidString)

        }
    }
}

struct MedicationRowItem_Previews: PreviewProvider {
    static var previews: some View {
        MedicationRowItem(medication: Medication.example)
    }
}
