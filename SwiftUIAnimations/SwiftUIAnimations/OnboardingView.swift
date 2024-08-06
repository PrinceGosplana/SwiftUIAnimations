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

    var body: some View {
        ZStack {
            animatedBackground

            VStack {

                Text("Learn design $ code")
                    .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
                    .frame(width: 260, alignment: .leading)

                Text("Don't skip design. Learn design and code, by building real apps with React and Swift. Complete courses about the best tools.")
                    .customFont(.body)

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
                }
            }
        }
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
