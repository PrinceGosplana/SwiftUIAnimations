//
//  SignInView.swift
//  SwiftUIAnimations
//
//  Created by Oleksandr Isaiev on 06.08.2024.
//

import SwiftUI

struct SignInView: View {

    @State var email = ""
    @State var password = ""

    var body: some View {
        VStack(spacing: 24) {
            Text("Sign In")
                .customFont(.largeTitle)

            Text("Access to 240+ hours of content. Learn design and code, by building real apps with React and Swift.")
                .customFont(.headline)

            VStack {
                Text("Email")
                    .customFont(.headline)
                .foregroundStyle(.secondary)

                TextField("", text: $email)
                    .padding(15)
                    .padding(.leading, 36)
                    .background(.white)
                    .mask {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke()
                            .fill(.black.opacity(0.1))
                    }
                    .overlay {
                        Image(.iconEmail)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
            }

            Divider()

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
    }
}

#Preview {
    SignInView()
}
