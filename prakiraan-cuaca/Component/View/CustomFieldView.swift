//
//  CustomFieldView.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 10/10/25.
//

import SwiftUI

struct CustomFieldView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(title)
                    .font(.title)
            }.padding(.horizontal)
            HStack {
                TextField(placeholder, text: $text)
                    .textFieldStyle(.roundedBorder)
                    .font(.body)
                    .frame(height: 44)
                    .cornerRadius(8)
                    .disableAutocorrection(true)
            }.padding(8)
        }
    }
}

#Preview {
    CustomFieldView(title: "Title",
                    placeholder: "Placeholder",
                    text: .constant(""))
}
