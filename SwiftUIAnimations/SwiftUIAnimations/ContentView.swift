//
//  ContentView.swift
//  SwiftUIAnimations
//
//  Created by Oleksandr Isaiev on 05.08.2024.
//

import RiveRuntime
import SwiftUI

struct ContentView: View {

    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    @State private var isMenuOpen = false
    var body: some View {
        ZStack {
            switch selectedTab {
            case .chat:
                Text("Chat")
            case .search:
                Text("Search")
            case .timer:
                Text("Timer")
            case .bell:
                Text("Bell")
            case .user:
                Text("User")
            }
            
            button.view()
                .frame(width: 44, height: 44)
                .mask(Circle())
                .shadow(color: Color(.shadow).opacity(0.2), radius: 5, x: 0, y: 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .onTapGesture {
                    try? button.setInput("isOpen", value: isMenuOpen)
                    isMenuOpen.toggle()
                }

            TabBarView()
        }
    }
}

#Preview {
    ContentView()
}
