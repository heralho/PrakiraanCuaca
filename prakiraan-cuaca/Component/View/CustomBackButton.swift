//
//  CustomBackButton.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 10/10/25.
//

import SwiftUI

struct CustomBackButton: View {
    @EnvironmentObject var navigator: Navigator

    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "chevron.left")
            Text("Back")
        }
        .onTapGesture {
            navigator.pop()
        }
    }
}

//#Preview {
//    CustomBackButton()
//}
