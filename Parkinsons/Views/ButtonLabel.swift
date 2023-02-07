
import SwiftUI

struct ButtonLabel: View {
    var iconName: String
    var body: some View {
        Image(systemName: iconName)
        .frame(width: 120, height: 120)
        .foregroundColor(.white)
        
        .background(Color.blue)
        .clipShape(Circle())
    }
}

struct ButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabel(iconName: "plus")
    }
}



