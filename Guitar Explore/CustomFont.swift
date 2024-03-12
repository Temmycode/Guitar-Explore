//
//  CustomFont.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 28/02/2024.
//

import SwiftUI

struct CustomFont: ViewModifier {
    private let style: TextStyles
    
    init(_ style: TextStyles) {
        self.style = style
    }
    
    func body(content: Content) -> some View {
        content
            .font(getFont(for: style))
    }
    
    private func getFont(for style: TextStyles) -> Font {
        switch style {
        case .title:
            return .custom("LexendMega-Bold", size: 18)
        case .headline:
            return .custom("LexendMega-Medium", size: 15)
        case .subheadline:
            return .custom("LexendMega-Medium", size: 13)
        case .body:
            return .custom("LexendMega-Regular", size: 12)
        case .caption:
            return .custom("LexendMega-Light", size: 10)
        }
    }
}

extension View {
    func customFont(_ style: TextStyles) -> some View {
        modifier(CustomFont(style))
    }
}

enum TextStyles {
    case title
    case headline
    case subheadline
    case body
    case caption
}
