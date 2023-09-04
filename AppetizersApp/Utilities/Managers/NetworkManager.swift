import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let decoder = JSONDecoder()
    let cache = NSCache<NSString, UIImage>()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    static let appetizerURL = baseURL + "appetizers"
    
    private init () {}
    
    func getAppetizers() async throws ->  [AppetizerModel] {
                guard let apiUrl = URL(string: NetworkManager.appetizerURL) else { throw APError.invalidURL }
                let (data, response) = try await URLSession.shared.data(from: apiUrl)

                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw APError.invalidResponse
                }

                guard let appetizerResponse = try? decoder.decode(AppetizerResponse.self, from: data) else {
                    throw APError.invalidData
                }
        return appetizerResponse.request
    }
    
    func downloadImage(from urlString: String) async -> UIImage? {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) { return image }
        guard let url = URL(string: urlString) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return nil }
            cache.setObject(image, forKey: cacheKey)
            return image
        } catch {
            return nil
        }
    }
}
