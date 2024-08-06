//
//  CustomFont.swift
//  SwiftUIAnimations
//
//  Created by Oleksandr Isaiev on 06.08.2024.
//

import SwiftUI

struct CustomFont: ViewModifier {
    let textStyle: TextStyle

    var name: String {
        switch textStyle {
        case .largeTitle, .title, .title2, .title3: "Poppins Bold"
        case .body, .subheadline, .footnote, .caption: "Inter Regular"
        case .headline, .subheadline2, .footnote2, .caption2: "Inter SemiBold"
        }
    }

    var size: CGFloat {
        switch textStyle {
        case .largeTitle: 34
        case .title: 28
        case .title2: 24
        case .title3: 20
        case .body: 17
        case .headline: 17
        case .subheadline: 15
        case .subheadline2: 15
        case .footnote: 13
        case .footnote2: 13
        case .caption: 12
        case .caption2: 12
        }
    }

    var relative: Font.TextStyle {
        switch textStyle {
        case .largeTitle: .largeTitle
        case .title: .title
        case .title2: .title2
        case .title3: .title3
        case .body: .body
        case .subheadline: .subheadline
        case .footnote: .footnote
        case .caption: .caption
        case .headline: .headline
        case .subheadline2: .subheadline
        case .footnote2: .footnote
        case .caption2: .caption
        }
    }

    func body(content: Content) -> some View {
        content
            .font(.custom(name, size: size, relativeTo: relative))
    }
}

extension View {
    func customFont(_ textStyle: TextStyle) -> some View {
        modifier(CustomFont(textStyle: textStyle))
    }
}

enum TextStyle {

    case largeTitle, title, title2, title3, body, subheadline, footnote, caption, headline, subheadline2, footnote2, caption2
}
