import SwiftUI

struct AppetizerDetailView: View {
    @EnvironmentObject var  order : Order
    let appetizer : AppetizerModel
    @Binding var isShowingDetail : Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 20) {
                    NutritionInfo(title: "Carbs", nutritionValue: appetizer.carbs)
                    NutritionInfo(title: "Calories", nutritionValue: appetizer.calories)
                    NutritionInfo(title: "Proteins", nutritionValue: appetizer.protein)
                
                }
            }
            .padding()
            
            Spacer()
            
            Button {
                isShowingDetail = false
                order.add(appetizer)
            } label: {
                // APButton(titleButton: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
                
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .modifier(StandardButtonStyle())
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            DismissButton()
        }, alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
    }
}


struct NutritionInfo : View {
    let title : String
    let nutritionValue : Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            
            Text("\(nutritionValue)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
