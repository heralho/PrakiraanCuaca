//
//  CustomImageView.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 14/10/25.
//

import SwiftUI
import SwiftDraw

struct CustomImageView: View {
    private let imageCache: IImageCache = ImageCache.shared
    
    let imageUrl: String?
    var width: CGFloat = 24
    var height: CGFloat = 24
    
    @State private var image: UIImage?
    
    var body: some View {
        if image == nil {
            ProgressView()
                .frame(width: width, height: height)
        }
        Image(uiImage: image ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
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
                    guard let svg = SVG(data: data) else {
                        return
                    }
                    
                    let image = svg.rasterize()
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
