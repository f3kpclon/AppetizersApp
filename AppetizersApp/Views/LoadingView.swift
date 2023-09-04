import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("Loading...")
                .font(.headline)
            ProgressView()
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
