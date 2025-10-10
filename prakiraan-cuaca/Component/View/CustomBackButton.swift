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
        HStack {
            Image(systemName: "arrowshape.backward.fill")
            Text("Back")
        }
        .onTapGesture {
            navigator.pop()
        }
    }
}
