//
//  SideMenu.swift
//  SwiftUIAnimations
//
//  Created by Oleksandr Isaiev on 12.08.2024.
//

import RiveRuntime
import SwiftUI

struct SideMenu: View {
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

            VStack {
                Rectangle()
                    .frame(height: 1)
                    .opacity(0.1)
                    .padding(.horizontal)

                HStack(spacing: 14) {
                    icon.view()
                        .frame(width: 32, height: 32)
                        .opacity(0.6)

                    Text("Home")
                        .customFont(.headline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(22)
                .onTapGesture {
                    try? icon.setInput("active", value: true)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        try? icon.setInput("active", value: true)
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


