import SwiftUI

@MainActor
final class ImageLoader : ObservableObject {
    @Published var image : Image? = nil
    
    func loadImage(fromUrlString urlString : String) async {
        Task {
                let downloadedImage = await NetworkManager.shared.downloadImage(from: urlString)
                guard let downloadedImage else { return }
                image = Image(uiImage: downloadedImage)
        }
    }
}

struct RemoteImage : View {
    var image : Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder")
    }
}



struct AppetizerRemoteImage : View {
    @StateObject var imageLoader = ImageLoader()
    let urlString : String
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .task {
                await imageLoader.loadImage(fromUrlString: urlString)
            }
    }
}
