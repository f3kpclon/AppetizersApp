import SwiftUI

final class Order: ObservableObject {
    @Published var items : [AppetizerModel] = []
    
    var totalPrice : Double {
        items.reduce(0) {$0 + $1.price }
    }
    
    func add(_ appetizer: AppetizerModel) {
        items.append(appetizer)
    }
    
    func deleteItems(at offSets: IndexSet)  {
        items.remove(atOffsets: offSets)
    }
}
