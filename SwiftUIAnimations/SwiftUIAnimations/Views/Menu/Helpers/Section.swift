//
//  Section.swift
//  SwiftUIAnimations
//
//  Created by Oleksandr Isaiev on 13.08.2024.
//

import SwiftUI

struct Section: View {

    let title: String
    let items: [MenuItem]
    @Binding var selectedMenu: SelectedMenu

    var body: some View {
        VStack {
            Text(title)
                .customFont(.subheadline2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.7)

            VStack(alignment: .leading, spacing: 0) {
                ForEach(items) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)
                    MenuRow(item: item, selectedMenu: $selectedMenu)
                }
            }
        }
    }
}

#Preview {
    Section(title: "Title", items: MenuItem.menuItems2, selectedMenu: .constant(.history))
}
