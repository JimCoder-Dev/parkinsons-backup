import SwiftUI

struct AlarmSelectionView: View {
    
    let numberOfAlarms = 1
    
    let morning = ["07:00", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30"]
    let afternoon = ["12:00", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00"]
    
    
    
    let evening =  ["17:00", "17:30", "18:00", "18:30", "19:00", "14:00", "19:30", "20:00", "21:00"]
    
    @Environment(\.dismiss) var dismiss
    
    @State private var isActive = false
    

    @State private var selectedTimeOfDay = "Morning"
   
    
    
    let alarmsToSet = 4
    @State var tracker = [true, false, false, false]
    @State var alarmNumber = 0
    @State private var defaultTime = 8
    @State private var selectedTime = defaultDate(hour: 8)
    
    
    
    
    
    
    
    var differentTimeOfDay = ["Morning", "Afternoon", "Evening", "Night"]
     
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    alarmnumbertoset
                    alarmtimepicker
                    nextandpreviousalarmbuttons
                    savealarmsbuttton
                    
                }
            }
            .navigationTitle("Select Alarm times")
        }
        .padding(.top, 8)
        
        
        .onAppear {
            UIDatePicker.appearance().minuteInterval = 15
        }

        .onDisappear {
            UIDatePicker.appearance().minuteInterval = 1
        }
        
    
        
    }
    
    static func defaultDate(hour: Int)-> Date{
        var components = DateComponents()
        
        components.hour = hour
        components.minute = 0
        let date = Calendar.current.date(from: components)
        
        return date ?? Date.now
    }
    
    func helloWorld(){
        print("Hello World")
    }
}

struct AlarmSelection_Previews: PreviewProvider {
    static var previews: some View {
        AlarmSelectionView()
    }
}




extension AlarmSelectionView{
    
    var alarmnumbertoset: some View{
        HStack{
            ForEach(0..<alarmsToSet, id: \.self){ number in
                    Text("\(number + 1) of \(alarmsToSet)")
                    .padding(12)
                    .background(tracker[number] ? Color.teal.opacity(0.5) : Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding(.top, 12)
    }
    
    var alarmtimepicker: some View{
        DatePicker("Please select a time", selection: $selectedTime, displayedComponents: .hourAndMinute)
            .datePickerStyle(.wheel)
            .labelsHidden()
            .background(Color.teal.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    
    var timeofday: some View{
        Picker("Selected time of day", selection: $selectedTimeOfDay){
            ForEach(differentTimeOfDay, id: \.self){ theTime in
                Text(theTime)
                    .onChange(of: theTime, perform: { newValue in
                        print("Hello World")
                    })
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal, 5)
    }
    
    var nextandpreviousalarmbuttons: some View{
        HStack{
            Button{
                if alarmNumber != 0{
                    tracker[alarmNumber].toggle()
                    alarmNumber -= 1
                    defaultTime -= 4
                    selectedTime = AlarmSelectionView.defaultDate(hour: defaultTime)
                }
            }label: {
                Text("Previous")
            }
            .disabled(alarmNumber == 0)
            
            Spacer()
            
            Button{
                if(alarmNumber != alarmsToSet-1){
                    alarmNumber += 1
                    tracker[alarmNumber].toggle()
                    defaultTime += 4
                    selectedTime = AlarmSelectionView.defaultDate(hour: defaultTime)
                }
                
            }label: {
                Text("Next")
            }
            .disabled(alarmNumber == alarmsToSet - 1)
            
        }
        .padding(.horizontal)
        .buttonStyle(.bordered)
    }
    
    @ViewBuilder
    var savealarmsbuttton: some View{
        if(alarmNumber == alarmsToSet - 1){
            Button{
                print("button pressed")
                    
            }label: {
                Text("Save")
                        .foregroundColor(.white)
            }
            .frame(width: 250, height: 50)
            .background(Color.teal)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}
