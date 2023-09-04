import SwiftUI

struct StandardButtonStyle : ViewModifier {
    func body(content: Content) -> some View {
        content
        .buttonStyle(.bordered)
        .tint(Color("brandPrimary"))
        .controlSize(.large)
    }
}
