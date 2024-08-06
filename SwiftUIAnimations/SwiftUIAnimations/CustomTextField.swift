//
//  CustomTextField.swift
//  SwiftUIAnimations
//
//  Created by Oleksandr Isaiev on 06.08.2024.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 36)
            .background(.white)
            .mask {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke()
                    .fill(.black.opacity(0.1))
            }
            .overlay {
                Image(.iconEmail)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
            }
    }
}

extension View {
    func customTextField() -> some View {
        modifier(CustomTextField())
    }
}
