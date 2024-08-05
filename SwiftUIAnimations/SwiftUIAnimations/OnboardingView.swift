//
//  OnboardingView.swift
//  SwiftUIAnimations
//
//  Created by Oleksandr Isaiev on 05.08.2024.
//

import RiveRuntime
import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            RiveViewModel(fileName: "shapes").view()
                .ignoresSafeArea()
                .blur(radius: 30)
                .background {
                    Image(.spline)
                        .blur(radius: 50)
                        .offset(x: 200, y: 100)
                }

            RiveViewModel(fileName: "button").view()
                .frame(width: 236, height: 64)
                .overlay {
                    Label("Start the course", systemImage: "arrow.forward")
                        .offset(x: 4, y: 4)
                        .font(.headline)
                }
        }
    }
}

#Preview {
    OnboardingView()
}
