import SwiftUI

struct AccountView: View {
  @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField : FormTextField?
    
    enum FormTextField {
    case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
        
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        // new for IOS 15
                        // .textInputAutocapitalization(.none)
                        // .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $viewModel.user.date, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("save changes")
                    }
                                        
                } header: {
                    Text("Personal Info")
                }
                
                Section {
                    Toggle("Extra napkins", isOn: $viewModel.user.extraNapkins)
                        .toggleStyle(SwitchToggleStyle(tint: Color("brandPrimary")))
                    Toggle("Extra refills", isOn: $viewModel.user.extraRefills)
                        .toggleStyle(SwitchToggleStyle(tint: Color("brandPrimary")))

                } header: {
                    Text("Request")
                }
            }
            .navigationTitle("🧟‍♀️ Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") {
                        focusedTextField = nil
                    }
                }
            }
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
