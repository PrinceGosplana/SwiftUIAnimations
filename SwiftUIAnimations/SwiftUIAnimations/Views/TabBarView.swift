//
//  TabBarView.swift
//  SwiftUIAnimations
//
//  Created by Oleksandr Isaiev on 09.08.2024.
//

import RiveRuntime
import SwiftUI

struct TabBarView: View {

    @State var selectedTab: Tab = .chat
    private let icon = RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT")

    /// Animation
    @Namespace private var animation

    var body: some View {
        VStack {
            Spacer(minLength: 0)
            HStack {
                content
            }
            .padding(12)
            .background(Color(.background2).opacity(0.8))
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(color: Color(.background2).opacity(0.3), radius: 20, x: 0, y: 20)
            .overlay(RoundedRectangle(cornerRadius: 24, style: .continuous).stroke(.linearGradient(colors: [.white.opacity(0.5), .white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing)))
            .padding(.horizontal, 24)
        }
    }

    var content: some View {
        ForEach(TabItem.tabItems) { item in
            Button {
                try? item.icon.setInput("active", value: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    try? item.icon.setInput("active", value: false)
                }
                withAnimation {
                    selectedTab = item.tab
                }
            } label: {
                item.icon.view()
                    .frame(height: 36)
                    .opacity(selectedTab == item.tab ? 1 : 0.5)
                    .background {
                        if selectedTab == item.tab {
                            RoundedRectangle(cornerRadius: 2)
                                .fill(Color.accentColor)
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                                .frame(width: 20, height: 4)
                                .offset(y: -20)
                        }
                    }
            }
        }
    }
}

#Preview {
    TabBarView()
}
