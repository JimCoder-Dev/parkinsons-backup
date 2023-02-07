import SwiftUI

struct MedicationHeaderExamples: View {
    var body: some View {
        Section{
            HStack{
                Text("9:00am")
                Spacer()
                Text("Some medication")
            }
        }header: {
            AlarmHeading(title: "Morning", color: Color.green)
        }
        Section{
            HStack{
                Text("9:00am")
                Spacer()
                Text("Some medication")
            }
        }header: {
            AlarmHeading(title: "Afternoon", color: Color.mint)
        }
        Section{
            HStack{
                Text("9:00am")
                Spacer()
                Text("Some medication")
            }
        }header: {
            AlarmHeading(title: "Evening", color: Color.cyan)
        }
        Section{
            HStack{
                Text("9:00am")
                Spacer()
                Text("Some medication")
            }
        }header: {
            AlarmHeading(title: "Night", color: Color.teal)
        }
    }
}

struct MedicationHeaderExamples_Previews: PreviewProvider {
    static var previews: some View {
        MedicationHeaderExamples()
    }
}
