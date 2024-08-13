//
//  SideMenu.swift
//  SwiftUIAnimations
//
//  Created by Oleksandr Isaiev on 12.08.2024.
//

import RiveRuntime
import SwiftUI

struct SideMenu: View {
    @State var selectedMenu: SelectedMenu = .home
    @State var isDarkMode = false
    let icon = RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME")

    var body: some View {
        VStack {
            HStack {

                Image(systemName: "person")
                    .padding(12)
                    .background(.white.opacity(0.2))
                    .mask(Circle())

                VStack(alignment: .leading, spacing: 2) {
                    Text("Nenu").customFont(.body)
                    Text("UI Designer").customFont(.subheadline).opacity(0.7)
                }
                Spacer()
            }
            .padding()

            Section(title: "BROWSE", items: MenuItem.menuItems, selectedMenu: $selectedMenu)

            Section(title: "HISTORY", items: MenuItem.menuItems2, selectedMenu: $selectedMenu)

            HStack(spacing: 14) {
                MenuItem.menuItems3[0].icon.view()
                    .frame(width: 32, height: 32)
                    .opacity(0.6)
                    .onChange(of: isDarkMode) { oldValue, newValue in
                        if newValue {
                            try? MenuItem.menuItems3[0].icon.setInput("active", value: true)
                        } else {
                            try? MenuItem.menuItems3[0].icon.setInput("active", value: false)
                        }
                    }

                Text(MenuItem.menuItems3[0].text)
                    .customFont(.headline)
                Toggle("", isOn: $isDarkMode)
            }
            .padding(20)

            Spacer()
        }
        .foregroundStyle(.white)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(Color(hex: "17203A"))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    SideMenu()
}
