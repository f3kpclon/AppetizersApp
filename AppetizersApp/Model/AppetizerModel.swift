import Foundation

struct AppetizerModel: Codable, Identifiable {
    let id : Int
    let name : String
    let description : String
    let price : Double
    let imageURL : String
    let calories : Int
    let protein : Int
    let carbs : Int
}

struct AppetizerResponse : Codable {
    let request : [AppetizerModel]
}


struct MockData {
    static let sampleAppetizer = AppetizerModel(
                id: 001,
                name: "Test Appetizer",
                description: "this is a description",
                price: 1000.0,
                imageURL: "",
                calories: 200,
                protein: 46,
                carbs: 310)
    
    static let appetizers = [
        sampleAppetizer,
        sampleAppetizer,
        sampleAppetizer,
        sampleAppetizer,
        sampleAppetizer,
        sampleAppetizer,
        sampleAppetizer,
        sampleAppetizer,
        sampleAppetizer,
        sampleAppetizer,
        sampleAppetizer,
        sampleAppetizer,
        sampleAppetizer
    ]
    
    static let orderOne = AppetizerModel(
                id: 002,
                name: "Test Appetizer 2",
                description: "this is a description",
                price: 1000.0,
                imageURL: "",
                calories: 200,
                protein: 46,
                carbs: 310)
    
    static let orderTwo = AppetizerModel(
                id: 003,
                name: "Test Appetizer 3",
                description: "this is a description",
                price: 1000.0,
                imageURL: "",
                calories: 200,
                protein: 46,
                carbs: 310)
    
    static let orderThree = AppetizerModel(
                id: 004,
                name: "Test Appetizer 4",
                description: "this is a description",
                price: 1000.0,
                imageURL: "",
                calories: 200,
                protein: 46,
                carbs: 310)
    
    static let orderItems = [orderOne, orderTwo, orderThree]
        
}
