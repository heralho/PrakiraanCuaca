//
//  prakiraan_cuacaApp.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 10/10/25.
//

import SwiftUI

@main
struct prakiraan_cuacaApp: App {
    let imageCache: IImageCache = ImageCache.shared
    
    init() {
        imageCache.initSetup()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
