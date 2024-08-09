//
//  TabBarView.swift
//  SwiftUIAnimations
//
//  Created by Oleksandr Isaiev on 09.08.2024.
//

import RiveRuntime
import SwiftUI

struct TabBarView: View {

    private let icon = RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT")

    var body: some View {
        HStack {
            Button {
                try? icon.setInput("active", value: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    try? icon.setInput("active", value: false)
                }
            } label: {
                icon.view()
            }
        }
        .background(Color(.background2).opacity(0.8))
    }
}

#Preview {
    TabBarView()
}
