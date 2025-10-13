//
//  CustomFieldView.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 10/10/25.
//

import SwiftUI

struct CustomFieldView: View {
    let title: String
    var titleColor: Color = Color.black
    let placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    var backgroundColor: Color = Color.clear
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(titleColor)
            }.padding(.horizontal)
            HStack {
                TextField(placeholder, text: $text)
                    .textFieldStyle(.roundedBorder)
                    .font(.body)
                    .frame(height: 44)
                    .cornerRadius(8)
                    .disableAutocorrection(true)
            }.padding(.horizontal, 16)
        }
        .background(backgroundColor)
    }
}

#Preview {
    CustomFieldView(title: "Title",
                    titleColor: Color.white,
                    placeholder: "Placeholder",
                    text: .constant(""),
                    backgroundColor: Color.blueFrenchPass)
}
