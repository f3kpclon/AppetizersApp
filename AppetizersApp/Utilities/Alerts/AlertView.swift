import SwiftUI

struct AlertItem : Identifiable{
    let id  = UUID()
    let title : Text
    let message : Text
    let dismissButton : Alert.Button
}

struct AlertContext {
    
    static let invalidData = AlertItem(
        title: Text("Server Error."),
        message: Text("Invalid data from server."),
        dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(
        title: Text("Server Error."),
        message: Text("Invalid server response."),
        dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(
        title: Text("Server Error."),
        message: Text("Invalid URL."),
        dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(
        title: Text("Server Error."),
        message: Text("Unable to complete."),
        dismissButton: .default(Text("OK")))
    
    static let inavlidForm = AlertItem(
        title: Text("Invalid Form."),
        message: Text("Please ensure all fields in the form have been filled out."),
        dismissButton: .default(Text("OK")))
    
    static let inavlidEmail = AlertItem(
        title: Text("Invalid Email."),
        message: Text("Please ensure your email is correct."),
        dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess = AlertItem(
        title: Text("User Saved."),
        message: Text("User saved was successfull."),
        dismissButton: .default(Text("OK")))
    
    static let userSaveError = AlertItem(
        title: Text("Invalid User data."),
        message: Text("Profile Error."),
        dismissButton: .default(Text("OK")))
}

