//
//  CellBubleView.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 11/10/25.
//

import SwiftUI

struct CellBubleView: View {
    let title: String
    let id: String
    let isSelected: Bool
    var action: ((String)->Void)?
    
    var body: some View {
        ZStack {
            Button {
                action?(id)
            } label: {
                VStack(alignment: .center) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(isSelected ? .bold : .regular)
                        .foregroundStyle(Color.black.opacity(0.6))
                }
                .padding(16)
                .background(Color.white)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.blueFrenchPass, lineWidth: 2)
                })
            }
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 0)
            .padding(.horizontal, 4)
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    ScrollView(.horizontal) {
        HStack {
            CellBubleView(title: "Jakarta", id: "1", isSelected: false, action: nil)
        }
    }
}
