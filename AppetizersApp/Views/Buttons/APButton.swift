import SwiftUI

struct APButton: View {
    let titleButton : LocalizedStringKey
    var body: some View {
        Text(titleButton)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color("brandPrimary"))
            .cornerRadius(10)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(titleButton: "$100.00")
    }
}
