//
//  SignInView.swift
//  SwiftUIAnimations
//
//  Created by Oleksandr Isaiev on 06.08.2024.
//

import RiveRuntime
import SwiftUI

struct SignInView: View {

    @State var email = ""
    @State var password = ""
    let check = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")

    var body: some View {
        VStack(spacing: 24) {
            Text("Sign In")
                .customFont(.largeTitle)

            Text("Access to 240+ hours of content. Learn design and code, by building real apps with React and Swift.")
                .customFont(.headline)

            VStack(alignment: .leading, spacing: 0) {
                Text("Email")
                    .customFont(.headline)
                    .foregroundStyle(.secondary)

                TextField("", text: $email)
                    .customTextField()
            }

            VStack(alignment: .leading, spacing: 0) {
                Text("Password")
                    .customFont(.headline)
                    .foregroundStyle(.secondary)

                SecureField("", text: $password)
                    .customTextField(image: Image(.iconLock))
            }

            SignInButton()

            HStack {
                Rectangle().frame(height: 1).opacity(0.1)
                Text("OR").customFont(.subheadline2).foregroundStyle(.black.opacity(0.3))
                Rectangle().frame(height: 1).opacity(0.1)
            }

            Text("Sign up with Email, Apple or Google")
                .customFont(.subheadline)
                .foregroundStyle(.secondary)

            HStack {
                Image(.logoEmail).frame(maxWidth: .infinity)
                Image(.logoApple).frame(maxWidth: .infinity)
                Image(.logoGoogle).frame(maxWidth: .infinity)
            }
        }
        .padding(30)
        .background(.regularMaterial)
        .mask {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
        }
        .shadow(
            color: Color(.shadow).opacity(0.3),
            radius: 5,
            x: 0,
            y: 3
        )
        .shadow(
            color: Color(.shadow).opacity(0.3),
            radius: 30,
            x: 0,
            y: 30
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(
                    .linearGradient(
                        colors: [
                            Color.white.opacity(0.8),
                            Color.white.opacity(0.1)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
        .padding()
        .overlay {
            check.view()
                .frame(width: 100, height: 100)
                .allowsHitTesting(false)
        }
    }

    @ViewBuilder
    func SignInButton() -> some View {
        Button {
            try? check.triggerInput("Check")
        } label: {
            Label("Sign In", systemImage: "arrow.right")
                .customFont(.headline)
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(Color(hex: "F77D8E"))
                .foregroundStyle(.white)
                .cornerRadius(20, corners: [.topRight, .bottomLeft, .bottomRight])
                .cornerRadius(8, corners: [.topLeft])
                .shadow(color: Color(hex: "F77D8E").opacity(0.5), radius: 20, x: 0, y: 10)
        }
    }
}

#Preview {
    SignInView()
}
