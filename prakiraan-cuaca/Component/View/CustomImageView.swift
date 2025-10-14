//
//  CustomImageView.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 14/10/25.
//

import SwiftUI

struct CustomImageView: View {
    let imageCache: IImageCache = ImageCache.shared
    
    let imageUrl: String?
    @State private var image: UIImage?
    
    var body: some View {
        if image == nil {
            ProgressView()
        }
        Image(uiImage: image ?? UIImage())
            .onAppear {
                fetchImage()
            }
    }
    
    private func fetchImage() {
        guard let imageUrl = imageUrl,
              let url = URL(string: imageUrl) else {
            print("Wrong url format")
            return
        }
        
        if let image = imageCache.getCache(key: url.absoluteString) {
            self.image = image
        } else {
            Task {
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    guard let image = UIImage(data: data) else {
                        return
                    }
                    imageCache.setCache(image: image, key: url.absoluteString)
                    self.image = image
                }
            }
        }
    }
}

#Preview {
    CustomImageView(imageUrl: "https://api-apps.bmkg.go.id/storage/icon/cuaca/cerah-am.svg")
}
