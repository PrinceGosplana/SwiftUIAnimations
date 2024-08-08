//
//  OnboardingView.swift
//  SwiftUIAnimations
//
//  Created by Oleksandr Isaiev on 05.08.2024.
//

import RiveRuntime
import SwiftUI

struct OnboardingView: View {

    let button = RiveViewModel(fileName: "button")
    @State var showModel = false

    var body: some View {
        ZStack {
            animatedBackground

            content

            if showModel {
                SignInView()
                    .transition(.move(edge: .bottom))
            }
        }
    }

    var content: some View {
        VStack(alignment: .leading, spacing: 16) {

            Text("Learn design $ code")
                .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
                .frame(width: 260, alignment: .leading)

            Text("Don't skip design. Learn design and code, by building real apps with React and Swift. Complete courses about the best tools.")
                .customFont(.body)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer(minLength: 0)

            button.view()
                .frame(width: 236, height: 64)
                .overlay {
                    Label("Start the course", systemImage: "arrow.forward")
                        .offset(x: 4, y: 4)
                        .font(.headline)
                }
                .background {
                    Color.black
                        .clipShape(.rect(cornerRadius: 30))
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y: 10.0)
                }
                .onTapGesture {
                    button.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.spring()) {
                            showModel = true
                        }
                    }
            }

            Text("Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.")
                .customFont(.footnote)
                .opacity(0.7)
        }
        .padding(40)
        .padding(.top, 40)
    }

    private var animatedBackground: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background {
                Image(.spline)
                    .blur(radius: 50)
                    .offset(x: 200, y: 100)
            }
    }
}

#Preview {
    OnboardingView()
}
