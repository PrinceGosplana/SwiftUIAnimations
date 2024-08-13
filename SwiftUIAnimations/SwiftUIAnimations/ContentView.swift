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

            Color(.background2).ignoresSafeArea()

            SideMenu()
                .opacity(isMenuOpen ? 1 : 0)
                .offset(x: isMenuOpen ? 0 : -300)
                .rotation3DEffect(.degrees(isMenuOpen ? 0 : 30), axis: (x: 0, y: 1, z: 0))

            Group {
                switch selectedTab {
                case .chat:
                    HomeView()
                case .search:
                    Text("Search")
                case .timer:
                    Text("Timer")
                case .bell:
                    Text("Bell")
                case .user:
                    Text("User")
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 104)
            }
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .rotation3DEffect(
                .degrees(isMenuOpen ? 30 : 0),
                axis: (x: 0.0, y: -1.0, z: 0.0)
            )
            .offset(x: isMenuOpen ? 265 : 0)
            .scaleEffect(isMenuOpen ? 0.9 : 1)
            .ignoresSafeArea()


            button.view()
                .frame(width: 44, height: 44)
                .mask(Circle())
                .shadow(color: Color(.shadow).opacity(0.2), radius: 5, x: 0, y: 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()

                .offset(x: isMenuOpen ? 216 : 0)
                .onTapGesture {
                    try? button.setInput("isOpen", value: isMenuOpen)
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        isMenuOpen.toggle()
                    }
                }

            TabBarView()
                .offset(y: isMenuOpen ? 300 : 0)
        }
    }
}

#Preview {
    ContentView()
}
