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

            Text("BROWSE")
                .customFont(.subheadline2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.7)

            VStack(alignment: .leading, spacing: 0) {

                ForEach(MenuItem.menuItems) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)
                    HStack(spacing: 14) {
                        item.icon.view()
                            .frame(width: 32, height: 32)
                            .opacity(0.6)

                        Text(item.text)
                            .customFont(.headline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(22)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.blue)
                            .frame(maxWidth: selectedMenu == item.menu ? .infinity : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    )
                    .background(Color(.background2))
                    .onTapGesture {
                        try? item.icon.setInput("active", value: true)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            try? item.icon.setInput("active", value: true)
                        }
                        withAnimation {
                            selectedMenu = item.menu
                        }
                }
                }
            }

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


