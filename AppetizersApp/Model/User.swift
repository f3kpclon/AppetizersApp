import Foundation

struct User : Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var date = Date()
    var extraNapkins = false
    var extraRefills = false
}
