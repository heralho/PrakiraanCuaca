//
//  CustomFieldView.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 10/10/25.
//

import SwiftUI

struct CustomFieldView: View {
    let title: String
    @State private var text: String = ""
    
    var body: some View {
        HStack {
            TextField(title, text: $text)
        }
    }
}

#Preview {
    CustomFieldView(title: "ahay")
}
