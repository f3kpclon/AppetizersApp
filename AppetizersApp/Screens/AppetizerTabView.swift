
import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order : Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    // Image(systemName: "house")
                    // Text("Home")
                    Label("Home", systemImage: "house")
                }
            
            AccountView()
                .tabItem {
                    // Image(systemName: "person")
                    // Text("Account")
                    Label("Account", systemImage: "person")
                }
            
            OrderView()
                .tabItem {
                    // Image(systemName: "bag")
                    // Text("Order")
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
        }
        .tint(Color("brandPrimary"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
