import SwiftUI

@MainActor
final class AppetizerListViewModel : ObservableObject {
    
    @Published var appetizers : [AppetizerModel] = []
    @Published var alertItem : AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer : AppetizerModel?
    
    func getAppetizers() async {
        isLoading = true
        Task {
            do {
                let appetizer = try await NetworkManager.shared.getAppetizers()
                self.appetizers = appetizer
                isLoading = false
            } catch {
                if let apError = error as? APError {
                        switch apError {
                        case .invalidURL:
                            alertItem = AlertContext.invalidURL
                        case .invalidResponse:
                            alertItem = AlertContext.invalidResponse
                        case .invalidData:
                            alertItem = AlertContext.invalidData
                        case .unableToComplete:
                            alertItem = AlertContext.unableToComplete
                        }
                    }
            }
        }
    }
}
