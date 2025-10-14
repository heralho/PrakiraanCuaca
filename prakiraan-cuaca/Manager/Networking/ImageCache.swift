//
//  ImageCache.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 14/10/25.
//

import Foundation
import SwiftUI

protocol IImageCache {
    func initSetup()
    func setCache(image: UIImage, key: String)
    func getCache(key: String) -> UIImage?
}

class ImageCache: IImageCache {
    
    static let shared = ImageCache()
    let cache = NSCache<AnyObject, AnyObject>()
    
    func initSetup() {
        cache.countLimit = 100
        cache.totalCostLimit = 50 * 1024 * 1024
    }
    
    func setCache(image: UIImage, key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func getCache(key: String) -> UIImage? {
        guard let image = cache.object(forKey: key as NSString) as? UIImage else {
            return nil
        }
        return image
    }
}
