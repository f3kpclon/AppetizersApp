import SwiftUI

@MainActor
final class AccountViewModel: ObservableObject {
    @AppStorage("user") private var userData : Data?
    @Published var user = User()
    @Published var alertItem : AlertItem?

    private var isValidForm : Bool {
        guard !user.firstName.isEmpty,
              !user.lastName.isEmpty,
              !user.email.isEmpty else {
            alertItem = AlertContext.inavlidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.inavlidEmail
            return false
        }
        return true
    }

    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.userSaveError
        }
    }
    
    func retrieveUser() {
        guard let userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.userSaveError
        }
        
    }
}
