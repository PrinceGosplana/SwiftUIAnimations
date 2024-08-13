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
    @State private var show = false

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
            .scaleEffect(show ? 0.92 : 1)
            .ignoresSafeArea()

            Image(systemName: "person")
                .frame(width: 36, height: 36)
                .background(.white)
                .mask(Circle())
                .shadow(color: Color(.shadow).opacity(0.2), radius: 5, x: 0, y: 5)
                .onTapGesture {
                    withAnimation(.spring()) {
                        show = true
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding()
                .offset(y: 4)
                .offset(x: isMenuOpen ? 100 : 0)

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
                .onChange(of: isMenuOpen) { oldValue, newValue in
                    if newValue {
                        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
                    } else {
                        UIApplication.shared.setStatusBarStyle(.darkContent, animated: true)
                    }
                }

            TabBarView()
                .offset(y: isMenuOpen ? 300 : 0)
                .offset(y: show ? 200 : 0)
                .offset(y: -24)
                .background(
                    LinearGradient(colors: [Color(.background).opacity(0), Color(.background)], startPoint: .top, endPoint: .bottom)
                        .frame(height: 150)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .allowsHitTesting(false)
                )
                .ignoresSafeArea()

            if show {
                OnboardingView(show: $show)
                    .background(.white)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: .black.opacity(0.5), radius: 40, x: 0, y: 40)
                    .ignoresSafeArea(.all, edges: .top)
                    .transition(.move(edge: .top))
                    .offset(y: show ? -10 : 0)
                    .zIndex(1)
            }
        }
    }
}

#Preview {
    ContentView()
}
